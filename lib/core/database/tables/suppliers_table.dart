import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('SupplierDbModel')
class SuppliersTable extends Table {
  @override
  String get tableName => TableConstants.tableNameSuppliers;

  TextColumn get id => text().named(TableConstants.colId)();
  TextColumn get pharmacyId => text().named(TableConstants.colPharmacyId)();
  
  TextColumn get name => text().named(TableConstants.colName)();
  TextColumn get companyName => text().named(TableConstants.colCompanyName).nullable()();
  TextColumn get phone => text().named(TableConstants.colPhone).nullable()();
  
  RealColumn get openingBalance => real().named(TableConstants.colOpeningBalance).withDefault(const Constant(0.0))();
  RealColumn get currentBalance => real().named(TableConstants.colCurrentBalance).withDefault(const Constant(0.0))();
  
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
