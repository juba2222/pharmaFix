import 'package:drift/drift.dart';
import '../table_constants.dart';
import 'suppliers_table.dart';

@DataClassName('PurchaseInvoiceDbModel')
class PurchaseInvoicesTable extends Table {
  @override
  String get tableName => TableConstants.tableNamePurchaseInvoices;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  
  // Foreign Key with restrict delete
  IntColumn get supplierId => integer()
      .named(TableConstants.colSupplierId)
      .references(SuppliersTable, #id, onDelete: KeyAction.restrict)();
      
  TextColumn get invoiceNumber => text().named(TableConstants.colInvoiceNumber).nullable()();
  DateTimeColumn get invoiceDate => dateTime().named(TableConstants.colInvoiceDate)();
  
  RealColumn get totalAmount => real().named(TableConstants.colTotalAmount)();
  
  TextColumn get notes => text().named(TableConstants.colNotes).nullable()();
  
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();
}
