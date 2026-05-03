// =============================================================
// File: lib/features/suppliers/data/transactions/purchase_item_processor.dart
// Purpose: Process individual items within a purchase transaction.
// Layer: Data (Service)
// Dependencies: drift, uuid
// =============================================================

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart';

class PurchaseItemProcessor {
  final AppDatabase db;
  final _uuid = const Uuid();

  PurchaseItemProcessor(this.db);

  Future<void> process(Map<String, dynamic> item, String pharmacyId, String invoiceId) async {
    final String productId = item['productId'];
    final String unitId = item['unitId'];
    final double qty = item['quantity'];
    final double cost = item['purchasePrice'];
    final double sell = item['sellingPrice'];

    if (item['isNew'] == true) {
      await db.into(db.productsTable).insertOnConflictUpdate(
            ProductsTableCompanion.insert(
              id: productId,
              pharmacyId: pharmacyId,
              localName: item['productName'],
              barcode: Value(item['barcode']),
              minStockThreshold: 5.0,
            ),
          );
    }

    await db.into(db.productUnitsTable).insertOnConflictUpdate(
          ProductUnitsTableCompanion.insert(
            id: unitId, productId: productId, pharmacyId: pharmacyId,
            unitName: item['unitName'] ?? 'Unit', sellingPrice: sell,
            costPrice: Value(cost), isBaseUnit: Value(item['isBaseUnit'] ?? false),
          ),
        );

    final itemId = _uuid.v4();
    await db.into(db.purchaseInvoiceItemsTable).insert(
          PurchaseInvoiceItemsTableCompanion.insert(
            id: itemId, purchaseInvoiceId: invoiceId, productId: productId,
            quantity: qty, purchasePrice: cost,
            expiryDate: item['expiryDate'], batchNumber: Value(item['batchNumber']),
          ),
        );

    await db.into(db.productBatchesTable).insert(
          ProductBatchesTableCompanion.insert(
            id: _uuid.v4(), productId: productId, pharmacyId: pharmacyId,
            batchNumber: item['batchNumber'] ?? 'B-${_uuid.v4().substring(0, 8)}',
            expiryDate: item['expiryDate'], quantityBaseUnit: qty,
            purchasePrice: Value(cost), purchaseInvoiceItemId: Value(itemId),
          ),
        );
  }
}
