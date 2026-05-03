// =============================================================
// File: lib/features/suppliers/data/services/supplier_write_service.dart
// Purpose: Handles write operations for suppliers in Drift.
// Layer: Data (Service)
// Dependencies: drift, uuid
// =============================================================

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart';

class SupplierWriteService {
  final AppDatabase db;
  final _uuid = const Uuid();

  SupplierWriteService(this.db);

  Future<void> addSupplier(String pharmacyId, String name, String? company, String? phone, double openingBalance) async {
    await db.into(db.suppliersTable).insert(
          SuppliersTableCompanion.insert(
            id: _uuid.v4(),
            pharmacyId: pharmacyId,
            name: name,
            companyName: Value(company),
            phone: Value(phone),
            openingBalance: openingBalance,
            currentBalance: Value(openingBalance),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<void> addPayment(String pharmacyId, String supplierId, double amount, String? notes) async {
    await db.transaction(() async {
      await db.into(db.supplierPaymentsTable).insert(
            SupplierPaymentsTableCompanion.insert(
              id: _uuid.v4(),
              pharmacyId: pharmacyId,
              supplierId: supplierId,
              amount: amount,
              paymentDate: DateTime.now(),
              notes: Value(notes),
            ),
          );
      final s = await (db.select(db.suppliersTable)..where((t) => t.id.equals(supplierId))).getSingle();
      await (db.update(db.suppliersTable)..where((t) => t.id.equals(supplierId))).write(SuppliersTableCompanion(currentBalance: Value(s.currentBalance - amount)));
    });
  }
}
