import 'package:drift/drift.dart';
import '../models/product.dart';
import '../models/product_unit.dart';
import '../models/product_batch.dart';
import 'app_database.dart';


extension ProductExtensions on Product {
  ProductsTableCompanion toDbCompanion() {
    return ProductsTableCompanion(
      id: Value(id),
      pharmacyId: Value(pharmacyId),
      masterDrugId: Value(masterDrugId),
      localName: Value(localName),
      barcode: Value(barcode),
      minStockThreshold: Value(minStockThreshold),
      updatedAt: Value(updatedAt),
    );
  }
}

extension ProductUnitExtensions on ProductUnit {
  ProductUnitsTableCompanion toDbCompanion() {
    return ProductUnitsTableCompanion(
      id: Value(id),
      productId: Value(productId),
      pharmacyId: Value(pharmacyId),
      unitName: Value(unitName),
      conversionFactor: Value(conversionFactor),
      costPrice: Value(costPrice),
      sellingPrice: Value(sellingPrice),
      barcode: Value(barcode),
      isBaseUnit: Value(isBaseUnit),
      updatedAt: Value(updatedAt),
    );
  }
}

extension ProductBatchExtensions on ProductBatch {
  ProductBatchesTableCompanion toDbCompanion() {
    return ProductBatchesTableCompanion(
      id: Value(id),
      productId: Value(productId),
      pharmacyId: Value(pharmacyId),
      batchNumber: Value(batchNumber),
      expiryDate: Value(expiryDate),
      quantityBaseUnit: Value(quantityBaseUnit),
      purchasePrice: Value(purchasePrice ?? 0.0),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}
