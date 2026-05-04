// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_dao.dart';

// ignore_for_file: type=lint
mixin _$InventoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductsTableTable get productsTable => attachedDatabase.productsTable;
  $ProductBatchesTableTable get productBatchesTable =>
      attachedDatabase.productBatchesTable;
  $ProductUnitsTableTable get productUnitsTable =>
      attachedDatabase.productUnitsTable;
  InventoryDaoManager get managers => InventoryDaoManager(this);
}

class InventoryDaoManager {
  final _$InventoryDaoMixin _db;
  InventoryDaoManager(this._db);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db.attachedDatabase, _db.productsTable);
  $$ProductBatchesTableTableTableManager get productBatchesTable =>
      $$ProductBatchesTableTableTableManager(
        _db.attachedDatabase,
        _db.productBatchesTable,
      );
  $$ProductUnitsTableTableTableManager get productUnitsTable =>
      $$ProductUnitsTableTableTableManager(
        _db.attachedDatabase,
        _db.productUnitsTable,
      );
}
