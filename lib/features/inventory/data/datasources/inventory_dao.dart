import 'package:drift/drift.dart';
import 'package:pharma_fix/core/database/app_database.dart';

part 'inventory_dao.g.dart';

@DriftAccessor(tables: [ProductsTable, ProductBatchesTable, ProductUnitsTable])
class InventoryDao extends DatabaseAccessor<AppDatabase> with _$InventoryDaoMixin {
  InventoryDao(AppDatabase db) : super(db);

  Stream<List<TypedResult>> watchInventoryItems({
    String? search,
    bool onlyLowStock = false,
  }) {
    final qtySum = productBatchesTable.quantityBaseUnit.sum();
    final minExpiry = productBatchesTable.expiryDate.min();

    final query = select(productsTable).join([
      leftOuterJoin(
        productBatchesTable,
        productBatchesTable.productId.equalsExp(productsTable.id),
      ),
      leftOuterJoin(
        productUnitsTable,
        productUnitsTable.productId.equalsExp(productsTable.id) &
            productUnitsTable.isBaseUnit.equals(true),
      ),
    ]);

    query.addColumns([qtySum, minExpiry]);

    if (search != null && search.isNotEmpty) {
      query.where(productsTable.localName.contains(search) |
          productsTable.barcode.contains(search));
    }

    query.groupBy([productsTable.id]);

    return query.watch();
  }

  Future<void> addOpeningStock({
    required String productId,
    required String batchNumber,
    required double qty,
    required double cost,
    required DateTime expiry,
  }) async {
    await into(productBatchesTable).insert(ProductBatchesTableCompanion.insert(
      id: Value(const Uuid().v4()),
      productId: productId,
      pharmacyId: 'default', // Should come from auth
      batchNumber: batchNumber,
      expiryDate: expiry,
      quantityBaseUnit: qty,
      purchasePrice: Value(cost),
      isSynced: const Value(false),
    ));
  }
}
