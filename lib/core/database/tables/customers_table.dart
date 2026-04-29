import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('CustomerDbModel')
class CustomersTable extends Table {
  @override
  String get tableName => TableConstants.tableNameCustomers;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  IntColumn get pharmacyId => integer().named(TableConstants.colPharmacyId)();
  TextColumn get name => text().named(TableConstants.colName)();
  TextColumn get phone => text().named(TableConstants.colPhone).nullable()();
  
  // Point 3: Track debt
  RealColumn get totalDebt => real().named(TableConstants.colTotalDebt).withDefault(const Constant(0.0))();
  
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();
}
