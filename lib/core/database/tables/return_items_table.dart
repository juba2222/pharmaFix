import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('ReturnItemDbModel')
class ReturnItemsTable extends Table {
  @override
  String get tableName => TableConstants.tableNameReturnItems;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  IntColumn get returnId => integer().named(TableConstants.colReturnId)();
  IntColumn get invoiceItemId => integer().named(TableConstants.colInvoiceItemId)();
  
  RealColumn get quantity => real().named(TableConstants.colQuantity)();
  RealColumn get refundAmount => real().named(TableConstants.colRefundAmount)();
}
