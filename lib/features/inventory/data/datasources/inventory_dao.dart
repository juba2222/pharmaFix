import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/tables/products_table.dart';
import '../../../../core/database/tables/product_batches_table.dart';
import '../../../../core/database/tables/product_units_table.dart';

part 'inventory_dao.g.dart';

@DriftAccessor(tables: [ProductsTable, ProductBatchesTable, ProductUnitsTable])
class InventoryDao extends DatabaseAccessor<AppDatabase> with _$InventoryDaoMixin {
  InventoryDao(super.db);

  Stream<List<TypedResult>> watchInventoryItems({
    String? search,
    bool onlyLowStock = false,
  }) {
    final qtySum = db.productBatchesTable.quantityInBaseUnit.sum();
    final minExpiry = db.productBatchesTable.expiryDate.min();

    final query = select(db.productsTable).join([
      leftOuterJoin(
        db.productBatchesTable,
        db.productBatchesTable.productId.equalsExp(db.productsTable.id),
      ),
      leftOuterJoin(
        db.productUnitsTable,
        db.productUnitsTable.productId.equalsExp(db.productsTable.id) &
            db.productUnitsTable.isBaseUnit.equals(true),
      ),
    ]);

    query.addColumns([qtySum, minExpiry]);

    if (search != null && search.isNotEmpty) {
      query.where(db.productsTable.localName.contains(search) |
          db.productsTable.barcode.contains(search));
    }

    query.groupBy([db.productsTable.id]);

    return query.watch();
  }

  Future<void> addOpeningStock({
    required String productId,
    required String batchNumber,
    required double qty,
    required double cost,
    required DateTime expiry,
  }) async {
    await into(db.productBatchesTable).insert(ProductBatchesTableCompanion.insert(
      id: Value(const Uuid().v4()),
      productId: productId,
      pharmacyId: 'default', // Should come from auth
      batchNumber: batchNumber,
      expiryDate: expiry,
      quantityInBaseUnit: qty,
      purchasePrice: Value(cost),
      isSynced: const Value(false),
    ));
  }
}
