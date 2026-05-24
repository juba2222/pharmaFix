// =============================================================
// File: lib/features/suppliers/data/transactions/cancel_purchase_invoice_transaction.dart
// Purpose: Atomic transaction for cancelling purchase invoices.
// Layer: Data (Transaction Service)
// =============================================================

import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';

class CancelPurchaseInvoiceTransaction {
  final AppDatabase db;

  CancelPurchaseInvoiceTransaction(this.db);

  Future<List<Map<String, dynamic>>> execute(String invoiceId) async {
    return db.transaction(() async {
      // 1. Fetch invoice and items
      final invoice = await (db.select(db.purchaseInvoicesTable)
            ..where((t) => t.id.equals(invoiceId)))
          .getSingle();
      
      if (invoice.status == 'cancelled') return [];

      final items = await (db.select(db.purchaseInvoiceItemsTable)
            ..where((t) => t.purchaseInvoiceId.equals(invoiceId)))
          .get();

      // 2. Check if any items from this invoice were sold
      for (final item in items) {
        final batch = await (db.select(db.productBatchesTable)
              ..where((t) => t.purchaseInvoiceItemId.equals(item.id)))
            .getSingleOrNull();
        
        if (batch == null) continue;
        
        // G1: Total received = purchased + bonus. If any was sold, quantity drops below this.
        final double totalReceived = item.quantity + item.bonusQuantity;
        if (batch.quantityInBaseUnit < totalReceived) {
          throw Exception('لا يمكن إلغاء الفاتورة: تم بيع أجزاء من المنتج ${item.productId}');
        }
      }

      // 3. Reverse logic
      for (final item in items) {
        // Remove batches
        await (db.delete(db.productBatchesTable)
              ..where((t) => t.purchaseInvoiceItemId.equals(item.id)))
            .go();
      }

      // 4. Update Supplier Balance
      final supplier = await (db.select(db.suppliersTable)
            ..where((t) => t.id.equals(invoice.supplierId)))
          .getSingle();
      
      // We subtract the debt added (totalAmount - paidAmount)
      // Actually we subtract invoice.remainingAmount? 
      // No, we reverse the whole invoice effect on supplier balance.
      // Supplier currentBalance += remaining? No.
      // When invoice was created: balance += remaining.
      // So when cancelling: balance -= remaining.
      
      await (db.update(db.suppliersTable)..where((t) => t.id.equals(invoice.supplierId)))
          .write(SuppliersTableCompanion(
        currentBalance: Value(supplier.currentBalance - invoice.remainingAmount),
      ));

      // 5. Mark invoice as cancelled
      await (db.update(db.purchaseInvoicesTable)..where((t) => t.id.equals(invoiceId)))
          .write(const PurchaseInvoicesTableCompanion(
        status: Value('cancelled'),
        remainingAmount: Value(0.0),
      ));

      // 6. Return items for Draft mode
      return items.map((i) => {
        'productId': i.productId,
        'quantity': i.quantity,
        'purchasePrice': i.purchasePrice,
        'unitId': i.unitId,
        'batchNumber': i.batchNumber,
        'expiryDate': i.expiryDate,
      }).toList();
    });
  }
}
