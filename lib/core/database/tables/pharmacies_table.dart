import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('PharmacyDbModel')
class PharmaciesTable extends Table {
  @override
  String get tableName => TableConstants.tableNamePharmacies;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  TextColumn get name => text().named(TableConstants.colName)();
  TextColumn get licenseNumber => text().named(TableConstants.colLicenseNumber).nullable()();
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();
}
