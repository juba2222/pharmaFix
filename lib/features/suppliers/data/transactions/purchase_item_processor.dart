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

  Future<void> process(
    Map<String, dynamic> item,
    String pharmacyId,
    String invoiceId,
  ) async {
    final String productId = item['productId'] as String;
    final String? unitId = item['unitId'] as String?;
    final double qty = (item['quantity'] as num).toDouble();
    final double bonusQty = (item['bonusQuantity'] as num? ?? 0.0).toDouble();
    final double cost = (item['purchasePrice'] as num).toDouble();
    final double sell = (item['sellingPrice'] as num? ?? 0.0).toDouble();

    // Effective Cost calculation (Recalculate based on bonus)
    final double totalQty = qty + bonusQty;
    final double effectiveCost = totalQty > 0 ? (qty * cost) / totalQty : cost;

    if (item['isNew'] == true) {
      await db.into(db.productsTable).insertOnConflictUpdate(
            ProductsTableCompanion.insert(
              id: productId,
              pharmacyId: pharmacyId,
              localName: item['productName'] as String,
              barcode: Value(item['barcode'] as String?),
              minStockThreshold: 5.0,
            ),
          );
    }

    if (unitId != null) {
      await db.into(db.productUnitsTable).insertOnConflictUpdate(
            ProductUnitsTableCompanion.insert(
              id: Value(unitId),
              productId: productId,
              pharmacyId: pharmacyId,
              unitName: item['unitName'] as String? ?? 'Unit',
              sellingPrice: sell,
              costPrice: Value(effectiveCost),
              isBaseUnit: Value(item['isBaseUnit'] as bool? ?? false),
            ),
          );
    } else {
      // If unit exists, update its selling price immediately (Auto-Pricing)
      // This fulfills: "يتحدث السعر على الرف وفي شاشة الـ POS فوراً"
      final unit = await (db.select(db.productUnitsTable)
            ..where((t) => t.productId.equals(productId) & t.id.equals(unitId)))
          .getSingleOrNull();
      if (unit != null) {
        await (db.update(db.productUnitsTable)
              ..where((t) => t.id.equals(unitId)))
            .write(ProductUnitsTableCompanion(
          sellingPrice: Value(sell),
          costPrice: Value(effectiveCost),
        ));
      }
    }

    final itemId = _uuid.v4();
    final batchNo = item['batchNumber'] as String?;
    final expiryDate = item['expiryDate'] as DateTime?;

    await db.into(db.purchaseInvoiceItemsTable).insert(
          PurchaseInvoiceItemsTableCompanion.insert(
            id: itemId,
            purchaseInvoiceId: invoiceId,
            productId: productId,
            quantity: qty,
            purchasePrice: cost,
            unitId: Value(unitId),
            expiryDate: Value(expiryDate),
            batchNumber: Value(batchNo),
          ),
        );

    final newBatchId = _uuid.v4();
    await db.into(db.productBatchesTable).insert(
          ProductBatchesTableCompanion.insert(
            id: newBatchId,
            productId: productId,
            pharmacyId: pharmacyId,
            batchNumber: batchNo ?? 'B-${newBatchId.substring(0, 8)}',
            expiryDate: expiryDate ?? DateTime.now().add(const Duration(days: 365)),
            quantityInBaseUnit: totalQty, // Purchased + Bonus
            purchasePrice: Value(effectiveCost),
            purchaseInvoiceItemId: Value(itemId),
          ),
        );
  }
}
