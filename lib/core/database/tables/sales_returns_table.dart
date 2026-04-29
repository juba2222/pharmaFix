import 'package:drift/drift.dart';
import '../table_constants.dart';
import '../uuid_instance.dart';

import 'invoices_table.dart';
import 'cash_sessions_table.dart';
import 'pharmacies_table.dart';
import 'users_table.dart';

@DataClassName('SalesReturnDbModel')
class SalesReturnsTable extends Table {
  @override
  String get tableName => 'sales_returns';

  // Primary Key
  TextColumn get id => text().clientDefault(() => uuid.v4()).named(TableConstants.colId)();

  // Foreign Keys
  TextColumn get pharmacyId => text().named(TableConstants.colPharmacyId).references(PharmaciesTable, #id)();
  TextColumn get invoiceId => text().named(TableConstants.colInvoiceId).references(InvoicesTable, #id)();
  TextColumn get sessionId => text().named(TableConstants.colSessionId).references(CashSessionsTable, #id)();
  TextColumn get userId => text().named(TableConstants.colUserId).references(UsersTable, #id)();

  // Fields
  RealColumn get totalRefundAmount => real().named(TableConstants.colTotalRefundAmount)();

  // Timestamps & Sync
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).nullable()();
  DateTimeColumn get updatedAt => dateTime().named(TableConstants.colUpdatedAt).nullable()();
  BoolColumn get isSynced => boolean().named(TableConstants.colIsSynced).withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
