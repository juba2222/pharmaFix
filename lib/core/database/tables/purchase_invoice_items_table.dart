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
      
  // unitId and batchId are nullable — batch may not exist yet at insert time
  TextColumn get unitId => text()
      .named(TableConstants.colUnitId)
      .nullable()();
      
  TextColumn get batchId => text()
      .named(TableConstants.colBatchId)
      .nullable()();
      
  RealColumn get quantity => real().named(TableConstants.colQuantity)();

  // G1: Explicit bonus quantity — needed for correct cancellation logic.
  // Total received = quantity + bonusQuantity.
  RealColumn get bonusQuantity =>
      real().named('bonus_quantity').withDefault(const Constant(0.0))();

  RealColumn get purchasePrice => real().named(TableConstants.colPurchasePrice)();
  
  DateTimeColumn get expiryDate => dateTime().named(TableConstants.colExpiryDate).nullable()();
  TextColumn get batchNumber => text().named(TableConstants.colBatchNumber).nullable()();
  
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
