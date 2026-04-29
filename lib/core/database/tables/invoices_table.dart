import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('InvoiceDbModel')
class InvoicesTable extends Table {
  @override
  String get tableName => TableConstants.tableNameInvoices;

  // Primary Key (UUID as Text)
  TextColumn get id => text().named(TableConstants.colId)();

  // Foreign Keys (UUID as Text)
  TextColumn get pharmacyId => text().named(TableConstants.colPharmacyId)();
  TextColumn get sessionId => text().named(TableConstants.colSessionId)();
  TextColumn get userId => text().named(TableConstants.colUserId)();
  TextColumn get customerId => text().named(TableConstants.colCustomerId).nullable()();

  // Amounts
  RealColumn get totalAmount => real().named(TableConstants.colTotalAmount)();
  RealColumn get paidAmount => real().named(TableConstants.colPaidAmount)();
  RealColumn get discountTotal => real().named('discount_total').withDefault(const Constant(0.0))();

  // Metadata
  TextColumn get paymentMethod => text().named('payment_method')();
  TextColumn get status => text().named(TableConstants.colStatus)();

  // Timestamps & Sync
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).nullable()();
  DateTimeColumn get updatedAt => dateTime().named(TableConstants.colUpdatedAt).nullable()();
  BoolColumn get isSynced => boolean().named(TableConstants.colIsSynced).withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
