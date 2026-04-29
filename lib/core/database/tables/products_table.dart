import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('ProductDbModel')
class ProductsTable extends Table {
  @override
  String get tableName => TableConstants.tableNameProducts;

  // Primary Key (UUID as Text)
  TextColumn get id => text().named(TableConstants.colId)();
  
  // Foreign Keys (UUID as Text)
  TextColumn get pharmacyId => text().named(TableConstants.colPharmacyId)();
  TextColumn get masterDrugId => text().named('master_drug_id').nullable()();
  
  // Fields
  TextColumn get localName => text().named('local_name')();
  TextColumn get barcode => text().named(TableConstants.colBarcode).nullable()();
  RealColumn get minStockThreshold => real().named(TableConstants.colMinStockThreshold)();
  
  // Timestamps
  DateTimeColumn get updatedAt => dateTime().named(TableConstants.colUpdatedAt).nullable()();
  BoolColumn get isSynced => boolean().named(TableConstants.colIsSynced).withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
