import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('ManufacturerDbModel')
class ManufacturersTable extends Table {
  @override
  String get tableName => TableConstants.tableNameManufacturers;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  IntColumn get pharmacyId => integer().named(TableConstants.colPharmacyId)();
  TextColumn get name => text().named(TableConstants.colName)();
}
