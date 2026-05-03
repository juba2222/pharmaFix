import 'package:drift/drift.dart';
import '../table_constants.dart';
import 'suppliers_table.dart';

@DataClassName('SupplierPaymentDbModel')
class SupplierPaymentsTable extends Table {
  @override
  String get tableName => TableConstants.tableNameSupplierPayments;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  
  // Foreign Key with restrict delete
  IntColumn get supplierId => integer()
      .named(TableConstants.colSupplierId)
      .references(SuppliersTable, #id, onDelete: KeyAction.restrict)();
      
  RealColumn get amount => real().named(TableConstants.colAmount)();
  DateTimeColumn get paymentDate => dateTime().named(TableConstants.colPaymentDate)();
  TextColumn get notes => text().named(TableConstants.colNotes).nullable()();
  
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();
}
