import 'package:drift/drift.dart';
import '../table_constants.dart';
import '../uuid_instance.dart';

import 'purchase_returns_table.dart';
import 'products_table.dart';
import 'product_units_table.dart';
import 'product_batches_table.dart';

@DataClassName('PurchaseReturnItemDbModel')
class PurchaseReturnItemsTable extends Table {
  @override
  String get tableName => 'purchase_return_items';

  // Primary Key
  TextColumn get id => text().clientDefault(() => uuid.v4()).named(TableConstants.colId)();

  // Foreign Keys
  TextColumn get returnId => text().named(TableConstants.colReturnId).references(PurchaseReturnsTable, #id)();
  TextColumn get productId => text().named(TableConstants.colProductId).references(ProductsTable, #id)();
  TextColumn get unitId => text().named(TableConstants.colUnitId).references(ProductUnitsTable, #id)();
  TextColumn get batchId => text().named(TableConstants.colBatchId).references(ProductBatchesTable, #id).nullable()();

  // Fields
  RealColumn get quantity => real().named(TableConstants.colQuantity)();
  RealColumn get refundAmount => real().named(TableConstants.colRefundAmount)();

  // Timestamps
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).nullable()();
  DateTimeColumn get updatedAt => dateTime().named(TableConstants.colUpdatedAt).nullable()();
  BoolColumn get isSynced => boolean().named(TableConstants.colIsSynced).withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
