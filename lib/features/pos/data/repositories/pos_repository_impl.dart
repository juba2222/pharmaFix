// =============================================================
// File: lib/features/pos/data/repositories/pos_repository_impl.dart
// Purpose: Implement getOldestBatch and update imports.
// =============================================================

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/sale_item_entity.dart';
import '../../domain/repositories/i_pos_repository.dart';
import '../../../../core/models/product.dart';
import '../../../../core/models/product_unit.dart';

class PosRepositoryImpl implements IPosRepository {
  final AppDatabase _db;
  PosRepositoryImpl(this._db);

  @override
  Future<Either<Failure, ProductBatchDbModel?>> getOldestBatch(String productId) async {
    try {
      final batch = await (_db.select(_db.productBatchesTable)
            ..where((t) => t.productId.equals(productId))
            ..orderBy([(t) => drift.OrderingTerm(expression: t.expiryDate)])
            ..limit(1))
          .getSingleOrNull();
      return Right(batch);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> checkout(
    String sessionId, String userId, List<SaleItemEntity> cartItems,
    String paymentMethod, double paidAmount, String? customerId,
  ) async {
    try {
      final totalAmount = cartItems.fold(0.0, (sum, item) => sum + item.subtotal);
      final invoiceId = const Uuid().v4();
      await _db.transaction(() async {
        String phId = 'afbb7f9e-9643-4e7c-acbe-146aa66b2faf';
        await _db.into(_db.invoicesTable).insert(InvoicesTableCompanion.insert(
          id: invoiceId, pharmacyId: phId, sessionId: sessionId, userId: userId,
          customerId: customerId == null ? const drift.Value.absent() : drift.Value(customerId),
          totalAmount: totalAmount, paidAmount: paidAmount, paymentMethod: paymentMethod, status: 'completed',
        ));
        for (final item in cartItems) {
          final invItemId = const Uuid().v4();
          await _db.into(_db.invoiceItemsTable).insert(InvoiceItemsTableCompanion.insert(
            id: invItemId, invoiceId: invoiceId, productId: item.productId, unitId: item.unitId,
            quantity: item.quantity, originalUnitPrice: drift.Value(item.originalUnitPrice),
            appliedDiscount: drift.Value(item.appliedDiscount), finalUnitPrice: drift.Value(item.finalUnitPrice),
            subtotal: item.subtotal,
          ));
          final qtyToDeduct = item.quantity * item.conversionFactor;
          final batches = await (_db.select(_db.productBatchesTable)
                ..where((t) => t.productId.equals(item.productId))
                ..orderBy([(t) => drift.OrderingTerm(expression: t.expiryDate)]))
              .get();
          if (batches.isNotEmpty) {
            final target = batches.first;
            await (_db.update(_db.productBatchesTable)..where((t) => t.id.equals(target.id)))
                .write(ProductBatchesTableCompanion(
              quantityInBaseUnit: drift.Value(target.quantityInBaseUnit - qtyToDeduct),
              updatedAt: drift.Value(DateTime.now()),
            ));
          }
        }
      });
      return const Right(unit);
    } catch (e) { return Left(DatabaseFailure(e.toString())); }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts(String query) async {
    try {
      final rows = await (_db.select(_db.productsTable)
            ..where((t) => t.localName.like('%$query%') | t.barcode.like('%$query%')))
          .get();
      return Right(rows.map((r) => Product(
        id: r.id, pharmacyId: r.pharmacyId, localName: r.localName, barcode: r.barcode,
        minStockThreshold: r.minStockThreshold, updatedAt: r.updatedAt,
      )).toList());
    } catch (e) { return Left(DatabaseFailure(e.toString())); }
  }

  @override
  Future<Either<Failure, Product>> lookupProduct(String barcode) async {
    try {
      final r = await (_db.select(_db.productsTable)..where((t) => t.barcode.equals(barcode))).getSingleOrNull();
      if (r == null) return Left(DatabaseFailure('Not found'));
      return Right(Product(
        id: r.id, pharmacyId: r.pharmacyId, localName: r.localName, barcode: r.barcode,
        minStockThreshold: r.minStockThreshold, updatedAt: r.updatedAt,
      ));
    } catch (e) { return Left(DatabaseFailure(e.toString())); }
  }

  @override
  Future<Either<Failure, List<ProductUnit>>> getProductUnits(String productId) async {
    try {
      final rows = await (_db.select(_db.productUnitsTable)..where((t) => t.productId.equals(productId))).get();
      return Right(rows.map((r) => ProductUnit(
        id: r.id, productId: r.productId, pharmacyId: r.pharmacyId, unitName: r.unitName,
        conversionFactor: r.conversionFactor, sellingPrice: r.sellingPrice, isBaseUnit: r.isBaseUnit,
      )).toList());
    } catch (e) { return Left(DatabaseFailure(e.toString())); }
  }

}
