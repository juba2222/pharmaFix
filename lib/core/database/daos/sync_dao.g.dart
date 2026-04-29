// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_dao.dart';

// ignore_for_file: type=lint
mixin _$SyncDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductsTableTable get productsTable => attachedDatabase.productsTable;
  $InvoicesTableTable get invoicesTable => attachedDatabase.invoicesTable;
  $ProductBatchesTableTable get productBatchesTable =>
      attachedDatabase.productBatchesTable;
  $ProductUnitsTableTable get productUnitsTable =>
      attachedDatabase.productUnitsTable;
  $InvoiceItemsTableTable get invoiceItemsTable =>
      attachedDatabase.invoiceItemsTable;
  SyncDaoManager get managers => SyncDaoManager(this);
}

class SyncDaoManager {
  final _$SyncDaoMixin _db;
  SyncDaoManager(this._db);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db.attachedDatabase, _db.productsTable);
  $$InvoicesTableTableTableManager get invoicesTable =>
      $$InvoicesTableTableTableManager(_db.attachedDatabase, _db.invoicesTable);
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
  $$InvoiceItemsTableTableTableManager get invoiceItemsTable =>
      $$InvoiceItemsTableTableTableManager(
        _db.attachedDatabase,
        _db.invoiceItemsTable,
      );
}
