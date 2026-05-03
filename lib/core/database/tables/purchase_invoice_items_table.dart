import 'package:drift/drift.dart';
import '../table_constants.dart';
import 'purchase_invoices_table.dart';
import 'products_table.dart';

@DataClassName('PurchaseInvoiceItemDbModel')
class PurchaseInvoiceItemsTable extends Table {
  @override
  String get tableName => TableConstants.tableNamePurchaseInvoiceItems;

  TextColumn get id => text().named(TableConstants.colId)();
  
  TextColumn get purchaseInvoiceId => text()
      .named(TableConstants.colPurchaseInvoiceId)
      .references(PurchaseInvoicesTable, #id, onDelete: KeyAction.cascade)();
      
  TextColumn get productId => text()
      .named(TableConstants.colProductId)
      .references(ProductsTable, #id)();
      
  TextColumn get unitId => text()
      .named(TableConstants.colUnitId)
      .references(ProductUnitsTable, #id)();
      
  TextColumn get batchId => text()
      .named(TableConstants.colBatchId)
      .references(ProductBatchesTable, #id)();
      
  RealColumn get quantity => real().named(TableConstants.colQuantity)();
  RealColumn get purchasePrice => real().named(TableConstants.colPurchasePrice)();
  
  DateTimeColumn get expiryDate => dateTime().named(TableConstants.colExpiryDate)();
  TextColumn get batchNumber => text().named(TableConstants.colBatchNumber).nullable()();
  
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
