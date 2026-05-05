import 'package:drift/drift.dart';
import '../table_constants.dart';
import 'suppliers_table.dart';

@DataClassName('PurchaseInvoiceDbModel')
class PurchaseInvoicesTable extends Table {
  @override
  String get tableName => TableConstants.tableNamePurchaseInvoices;

  TextColumn get id => text().named(TableConstants.colId)();
  TextColumn get pharmacyId => text().named(TableConstants.colPharmacyId)();
  
  TextColumn get supplierId => text()
      .named(TableConstants.colSupplierId)
      .references(SuppliersTable, #id, onDelete: KeyAction.restrict)();
      
  TextColumn get invoiceNumber => text().named(TableConstants.colInvoiceNumber).nullable()();
  DateTimeColumn get invoiceDate => dateTime().named(TableConstants.colInvoiceDate)();
  
  RealColumn get totalAmount => real().named(TableConstants.colTotalAmount)();
  RealColumn get paidAmount => real().named(TableConstants.colPaidOnInvoice).withDefault(const Constant(0.0))();
  RealColumn get remainingAmount => real().named(TableConstants.colRemainingAmount)();
  
  TextColumn get status => text().named(TableConstants.colStatus)(); // 'paid', 'partial', 'unpaid'
  TextColumn get notes => text().named(TableConstants.colNotes).nullable()();
  
  BoolColumn get isSynced => boolean().named(TableConstants.colIsSynced).withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [];
}
