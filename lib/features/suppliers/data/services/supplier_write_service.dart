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

  Future<void> addSupplier(
    String pharmacyId,
    String name,
    String? company,
    String? phone,
    double openingBalance,
  ) async {
    await db.into(db.suppliersTable).insert(
          SuppliersTableCompanion.insert(
            id: _uuid.v4(),
            pharmacyId: pharmacyId,
            name: name,
            companyName: Value(company),
            phone: Value(phone),
            openingBalance: Value(openingBalance),
            currentBalance: Value(openingBalance),
            createdAt: Value(DateTime.now()),
          ),
        );
  }

  Future<void> addPayment(
    String pharmacyId,
    String supplierId,
    double amount,
    DateTime date,
    String? invoiceId,
    String? notes,
  ) async {
    await db.transaction(() async {
      // 1. Record the payment
      await db.into(db.supplierPaymentsTable).insert(
            SupplierPaymentsTableCompanion.insert(
              id: _uuid.v4(),
              pharmacyId: pharmacyId,
              supplierId: supplierId,
              amount: amount,
              paymentDate: date,
              notes: Value(invoiceId != null ? 'تسديد فاتورة $invoiceId' : notes),
            ),
          );

      // 2. Apply payment logic
      if (invoiceId != null) {
        // Specific Invoice Payment
        final inv = await (db.select(db.purchaseInvoicesTable)
              ..where((t) => t.id.equals(invoiceId)))
            .getSingle();

        double amountToApply = amount > inv.remainingAmount ? inv.remainingAmount : amount;
        double newRemaining = inv.remainingAmount - amountToApply;
        double newPaid = inv.paidAmount + amountToApply;
        String newStatus = newRemaining <= 0 ? 'paid' : 'partial';

        await (db.update(db.purchaseInvoicesTable)..where((t) => t.id.equals(invoiceId)))
            .write(PurchaseInvoicesTableCompanion(
          remainingAmount: Value(newRemaining),
          paidAmount: Value(newPaid),
          status: Value(newStatus),
        ));
      } else {
        // FIFO Waterfall: Apply payment to outstanding invoices
        double remainingPayment = amount;

        final outstandingInvoices = await (db.select(db.purchaseInvoicesTable)
              ..where((t) => t.supplierId.equals(supplierId) & t.remainingAmount.isBiggerThanValue(0.0))
              ..orderBy([(t) => OrderingTerm.asc(t.invoiceDate)]))
            .get();

        for (final inv in outstandingInvoices) {
          if (remainingPayment <= 0) break;

          double amountToApply = remainingPayment >= inv.remainingAmount
              ? inv.remainingAmount
              : remainingPayment;

          double newRemaining = inv.remainingAmount - amountToApply;
          double newPaid = inv.paidAmount + amountToApply;
          String newStatus = newRemaining <= 0 ? 'paid' : 'partial';

          await (db.update(db.purchaseInvoicesTable)..where((t) => t.id.equals(inv.id)))
              .write(PurchaseInvoicesTableCompanion(
            remainingAmount: Value(newRemaining),
            paidAmount: Value(newPaid),
            status: Value(newStatus),
          ));

          remainingPayment -= amountToApply;
        }
      }

      // 3. Update Supplier Total Balance
      final s = await (db.select(db.suppliersTable)
            ..where((t) => t.id.equals(supplierId)))
          .getSingle();
      await (db.update(db.suppliersTable)..where((t) => t.id.equals(supplierId)))
          .write(SuppliersTableCompanion(currentBalance: Value(s.currentBalance - amount)));
    });
  }
}
