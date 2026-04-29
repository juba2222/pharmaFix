// =============================================================
// File: lib/core/services/sync_service.dart
// Purpose: Offline-First sync engine between Drift (SSOT) and Supabase (remote).
//          syncDown → pulls catalog changes from Supabase into Drift.
//          syncUp   → pushes pending local transactions to Supabase.
// Layer: Core (Services)
// =============================================================

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/models/product.dart';
import '../../core/models/product_unit.dart';
import '../../core/models/product_batch.dart';
import '../database/app_database.dart';
import '../error/failures.dart';
import 'sync_preferences.dart';
import 'auth_preferences.dart';
import '../database/db_extensions.dart';

class SyncService {
  final AppDatabase _db;
  final SupabaseClient _supabase;

  SyncService(this._db, this._supabase);

  // ─────────────────────────────────────────────────────────────
  // SYNC DOWN — Supabase → Drift (incremental via timestamp)
  // ─────────────────────────────────────────────────────────────
  Future<Either<Failure, Unit>> syncDown() async {
    try {
      // 1. Get last sync timestamp and current pharmacy context
      final lastSyncStr = await SyncPreferences.getLastSyncTimestamp();
      final pharmacyId = await AuthPreferences.getPharmacyId();

      print('SYNC_DEBUG: Starting SyncDown for $pharmacyId since $lastSyncStr');

      if (pharmacyId == null) {
        print('SYNC_DEBUG: Cancelled. pharmacyId is null');
        return Left(ServerFailure('No pharmacy_id found. User must be logged in.'));
      }

      // 2. Fetch only records belonging to this pharmacy updated since last sync
      final responses = await Future.wait([
        _supabase
            .from('products')
            .select()
            .eq('pharmacy_id', pharmacyId)
            .gte('updated_at', lastSyncStr),
        _supabase
            .from('product_units')
            .select()
            .eq('pharmacy_id', pharmacyId)
            .gte('updated_at', lastSyncStr),
        _supabase
            .from('product_batches')
            .select()
            .eq('pharmacy_id', pharmacyId)
            .gte('updated_at', lastSyncStr),
      ]);

      print('SYNC_DEBUG: Fetched ${responses[0].length} products, ${responses[1].length} units, ${responses[2].length} batches');

      // 3. Upsert into Drift in a single batch transaction
      await _db.batch((batch) {
        for (var p in responses[0]) {
          batch.insert(
            _db.productsTable,
            Product.fromJson(p).toDbCompanion(),
            mode: drift.InsertMode.insertOrReplace,
          );
        }
        for (var u in responses[1]) {
          batch.insert(
            _db.productUnitsTable,
            ProductUnit.fromJson(u).toDbCompanion(),
            mode: drift.InsertMode.insertOrReplace,
          );
        }
        for (var b in responses[2]) {
          batch.insert(
            _db.productBatchesTable,
            ProductBatch.fromJson(b).toDbCompanion(),
            mode: drift.InsertMode.insertOrReplace,
          );
        }
      });

      // 4. Save successful sync timestamp for next incremental pull
      await SyncPreferences.saveLastSyncTimestamp();
      print('SYNC_DEBUG: SyncDown completed and timestamp updated');

      return const Right(unit);
    } catch (e) {
      print('SYNC_DEBUG: ERROR: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  // ─────────────────────────────────────────────────────────────
  // SYNC UP — Drift (pending) → Supabase
  // ─────────────────────────────────────────────────────────────
  Future<Either<Failure, Unit>> syncUp() async {
    try {
      // 1. Query all unsynced invoices from local Drift DB
      final pendingInvoices = await (_db.select(_db.invoicesTable)
            ..where((t) => t.isSynced.equals(false)))
          .get();

      if (pendingInvoices.isEmpty) return const Right(unit);

      // 2. Collect invoice IDs to query their line items
      final invoiceIds = pendingInvoices.map((e) => e.id).toList();

      final pendingItems = await (_db.select(_db.invoiceItemsTable)
            ..where((t) => t.invoiceId.isIn(invoiceIds)))
          .get();

      // 3. Map Drift rows to JSON for Supabase upsert
      final invoicesJson = pendingInvoices.map((inv) => {
        'id': inv.id,
        'pharmacy_id': inv.pharmacyId,
        'session_id': inv.sessionId,
        'user_id': inv.userId,
        'customer_id': inv.customerId,
        'total_amount': inv.totalAmount,
        'paid_amount': inv.paidAmount,
        'discount_total': inv.discountTotal,
        'payment_method': inv.paymentMethod,
        'status': inv.status,
        'created_at': inv.createdAt?.toIso8601String(),
        'updated_at': inv.updatedAt?.toIso8601String(),
      }).toList();

      final itemsJson = pendingItems.map((item) => {
        'id': item.id,
        'invoice_id': item.invoiceId,
        'product_id': item.productId,
        'unit_id': item.unitId,
        'batch_id': item.batchId,
        'quantity': item.quantity,
        'original_unit_price': item.originalUnitPrice,
        'applied_discount': item.appliedDiscount,
        'applied_premium': item.appliedPremium,
        'final_unit_price': item.finalUnitPrice,
        'subtotal': item.subtotal,
        'created_at': item.createdAt?.toIso8601String(),
        'updated_at': item.updatedAt?.toIso8601String(),
      }).toList();

      // 4. Push to Supabase (upsert = insert or update on conflict)
      await _supabase.from('invoices').upsert(invoicesJson);
      await _supabase.from('invoice_items').upsert(itemsJson);

      // 5. Mark as synced in Drift
      await _db.batch((batch) {
        for (final inv in pendingInvoices) {
          batch.update(
            _db.invoicesTable,
            InvoicesTableCompanion(isSynced: const drift.Value(true)),
            where: (t) => t.id.equals(inv.id),
          );
        }
        for (final item in pendingItems) {
          batch.update(
            _db.invoiceItemsTable,
            InvoiceItemsTableCompanion(isSynced: const drift.Value(true)),
            where: (t) => t.id.equals(item.id),
          );
        }
      });


      return const Right(unit);
    } catch (e) {
      // Network or mapping failure — app stays functional, pending rows remain
      return Left(ServerFailure(e.toString()));
    }
  }
}
