import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('AuditLogDbModel')
class AuditLogsTable extends Table {
  @override
  String get tableName => TableConstants.tableNameAuditLogs;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  IntColumn get userId => integer().named(TableConstants.colUserId).nullable()();
  
  TextColumn get action => text().named(TableConstants.colAction)();
  TextColumn get targetTable => text().named(TableConstants.colTableName)();
  
  TextColumn get oldValue => text().named(TableConstants.colOldValue).nullable()();
  TextColumn get newValue => text().named(TableConstants.colNewValue).nullable()();
  
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();
}
