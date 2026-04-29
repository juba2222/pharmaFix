import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('CategoryDbModel')
class CategoriesTable extends Table {
  @override
  String get tableName => TableConstants.tableNameCategories;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  IntColumn get pharmacyId => integer().named(TableConstants.colPharmacyId)();
  TextColumn get name => text().named(TableConstants.colName)();
}
