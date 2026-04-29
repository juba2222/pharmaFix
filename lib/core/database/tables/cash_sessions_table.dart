import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('CashSessionDbModel')
class CashSessionsTable extends Table {
  @override
  String get tableName => TableConstants.tableNameCashSessions;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  IntColumn get pharmacyId => integer().named(TableConstants.colPharmacyId)();
  IntColumn get userId => integer().named(TableConstants.colUserId)();
  
  DateTimeColumn get startTime => dateTime().named(TableConstants.colStartTime).withDefault(currentDateAndTime)();
  DateTimeColumn get endTime => dateTime().named(TableConstants.colEndTime).nullable()();
  
  RealColumn get openingBalance => real().named(TableConstants.colOpeningBalance).withDefault(const Constant(0.0))();
  RealColumn get totalSales => real().named(TableConstants.colTotalSales).withDefault(const Constant(0.0))();
  RealColumn get totalReturns => real().named(TableConstants.colTotalReturns).withDefault(const Constant(0.0))();
  RealColumn get totalExpenses => real().named(TableConstants.colTotalExpenses).withDefault(const Constant(0.0))();
  
  TextColumn get status => text().named(TableConstants.colStatus)(); // e.g., 'OPEN', 'CLOSED'
}
