import 'package:drift/drift.dart';
import '../table_constants.dart';
import '../uuid_instance.dart';

import 'products_table.dart';

@DataClassName('ProductUnitDbModel')
class ProductUnitsTable extends Table {
  @override
  String get tableName => TableConstants.tableNameProductUnits;

  // Primary Key (UUID as Text)
  TextColumn get id => text().clientDefault(() => uuid.v4()).named(TableConstants.colId)();

  // Foreign Keys
  TextColumn get productId => text().named(TableConstants.colProductId).references(ProductsTable, #id)();
  TextColumn get pharmacyId => text().named(TableConstants.colPharmacyId)();

  // Fields
  TextColumn get unitName => text().named(TableConstants.colUnitName)();
  RealColumn get conversionFactor => real().named(TableConstants.colConversionFactor).withDefault(const Constant(1.0))();
  RealColumn get costPrice => real().named(TableConstants.colCostPrice).withDefault(const Constant(0.0))();
  RealColumn get sellingPrice => real().named(TableConstants.colSellingPrice)();
  TextColumn get barcode => text().named(TableConstants.colBarcode).nullable()();
  BoolColumn get isBaseUnit => boolean().named(TableConstants.colIsBaseUnit).withDefault(const Constant(false))();

  // Timestamps
  DateTimeColumn get updatedAt => dateTime().named(TableConstants.colUpdatedAt).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
