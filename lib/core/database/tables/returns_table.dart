import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('ReturnDbModel')
class ReturnsTable extends Table {
  @override
  String get tableName => TableConstants.tableNameReturns;

  IntColumn get id => integer().named(TableConstants.colId).autoIncrement()();
  IntColumn get pharmacyId => integer().named(TableConstants.colPharmacyId)();
  IntColumn get invoiceId => integer().named(TableConstants.colInvoiceId)();
  IntColumn get userId => integer().named(TableConstants.colUserId)();
  
  RealColumn get totalRefund => real().named(TableConstants.colTotalRefund)();
  DateTimeColumn get returnDate => dateTime().named(TableConstants.colReturnDate).withDefault(currentDateAndTime)();
}
