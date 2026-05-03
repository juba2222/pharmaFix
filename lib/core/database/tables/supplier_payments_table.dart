import 'package:drift/drift.dart';
import '../table_constants.dart';
import 'suppliers_table.dart';

@DataClassName('SupplierPaymentDbModel')
class SupplierPaymentsTable extends Table {
  @override
  String get tableName => TableConstants.tableNameSupplierPayments;

  TextColumn get id => text().named(TableConstants.colId)();
  TextColumn get pharmacyId => text().named(TableConstants.colPharmacyId)();
  
  TextColumn get supplierId => text()
      .named(TableConstants.colSupplierId)
      .references(SuppliersTable, #id, onDelete: KeyAction.restrict)();
      
  RealColumn get amount => real().named(TableConstants.colAmount)();
  DateTimeColumn get paymentDate => dateTime().named(TableConstants.colPaymentDate)();
  TextColumn get notes => text().named(TableConstants.colNotes).nullable()();
  
  BoolColumn get isSynced => boolean().named(TableConstants.colIsSynced).withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
