import 'package:drift/drift.dart';
import '../table_constants.dart';
import 'product_units_table.dart';

@DataClassName('InvoiceItemDbModel')
class InvoiceItemsTable extends Table {
  @override
  String get tableName => TableConstants.tableNameInvoiceItems;

  // Primary Key (UUID as Text)
  TextColumn get id => text().named(TableConstants.colId)();

  // Foreign Keys (UUID as Text)
  TextColumn get invoiceId => text().named(TableConstants.colInvoiceId)();
  TextColumn get productId => text().named(TableConstants.colProductId)();
  TextColumn get unitId => text().named('unit_id').references(ProductUnitsTable, #id)();
  TextColumn get batchId => text().named(TableConstants.colBatchId).nullable()();
  
  // Fields
  RealColumn get quantity => real().named('quantity')();
  
  // Pricing Extensions
  RealColumn get originalUnitPrice => real().named(TableConstants.colOriginalUnitPrice).nullable()();
  RealColumn get appliedDiscount => real().named(TableConstants.colAppliedDiscount).withDefault(const Constant(0.0))();
  RealColumn get appliedPremium => real().named(TableConstants.colAppliedPremium).withDefault(const Constant(0.0))();
  RealColumn get finalUnitPrice => real().named(TableConstants.colFinalUnitPrice).nullable()();
  TextColumn get priceModifiedBy => text().named(TableConstants.colPriceModifiedBy).nullable()();

  RealColumn get subtotal => real().named(TableConstants.colSubtotal)();

  // Timestamps & Sync
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).nullable()();
  DateTimeColumn get updatedAt => dateTime().named(TableConstants.colUpdatedAt).nullable()();
  BoolColumn get isSynced => boolean().named(TableConstants.colIsSynced).withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
