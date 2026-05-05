import 'package:drift/drift.dart';
import '../table_constants.dart';
import 'customers_table.dart';

@DataClassName('CustomerPaymentDbModel')
class CustomerPaymentsTable extends Table {
  @override
  String get tableName => 'customer_payments';

  TextColumn get id => text().named(TableConstants.colId)();
  TextColumn get pharmacyId => text().named(TableConstants.colPharmacyId)();

  IntColumn get customerId => integer()
      .named(TableConstants.colCustomerId)
      .references(CustomersTable, #id)();

  RealColumn get amount => real().named(TableConstants.colAmount)();
  DateTimeColumn get paymentDate => dateTime().named(TableConstants.colPaymentDate)();
  TextColumn get notes => text().named(TableConstants.colNotes).nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
