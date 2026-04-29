import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('PaymentDbModel')
class PaymentsTable extends Table {
  @override
  String get tableName => TableConstants.tableNamePayments;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  IntColumn get invoiceId => integer().named(TableConstants.colInvoiceId).nullable()();
  IntColumn get customerId => integer().named(TableConstants.colCustomerId).nullable()();
  
  RealColumn get amount => real().named(TableConstants.colAmount)();
  TextColumn get method => text().named(TableConstants.colMethod)(); // e.g., 'CASH', 'CARD'
  
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();
}
