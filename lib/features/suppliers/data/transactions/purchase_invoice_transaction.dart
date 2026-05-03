// =============================================================
// File: lib/features/suppliers/data/transactions/purchase_invoice_transaction.dart
// Purpose: Atomic transaction for creating purchase invoices.
// Layer: Data (Transaction Service)
// Dependencies: drift, uuid
// =============================================================

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart';
import 'purchase_item_processor.dart';

class PurchaseInvoiceTransaction {
  final AppDatabase db;
  final _uuid = const Uuid();

  PurchaseInvoiceTransaction(this.db);

  Future<void> execute({
    required String supplierId, required String pharmacyId,
    required String? invoiceNumber, required DateTime date,
    required double totalAmount, required double paidAmount,
    required List<Map<String, dynamic>> items,
  }) async {
    return db.transaction(() async {
      final invoiceId = _uuid.v4();
      final remaining = totalAmount - paidAmount;
      final status = remaining <= 0 ? 'paid' : (paidAmount > 0 ? 'partial' : 'unpaid');

      await db.into(db.purchaseInvoicesTable).insert(
            PurchaseInvoicesTableCompanion.insert(
              id: invoiceId, pharmacyId: pharmacyId, supplierId: supplierId,
              invoiceNumber: Value(invoiceNumber), invoiceDate: date,
              totalAmount: totalAmount, paidAmount: Value(paidAmount),
              remainingAmount: remaining, status: status,
            ),
          );

      final processor = PurchaseItemProcessor(db);
      for (final item in items) { await processor.process(item, pharmacyId, invoiceId); }

      final supplier = await (db.select(db.suppliersTable)..where((t) => t.id.equals(supplierId))).getSingle();
      await (db.update(db.suppliersTable)..where((t) => t.id.equals(supplierId))).write(
        SuppliersTableCompanion(currentBalance: Value(supplier.currentBalance + remaining)),
      );

      if (paidAmount > 0) {
        await db.into(db.supplierPaymentsTable).insert(
              SupplierPaymentsTableCompanion.insert(
                id: _uuid.v4(), pharmacyId: pharmacyId, supplierId: supplierId,
                amount: paidAmount, paymentDate: date,
                notes: Value('دفع تلقائي عند الفاتورة $invoiceNumber'),
              ),
            );
      }
    });
  }
}
