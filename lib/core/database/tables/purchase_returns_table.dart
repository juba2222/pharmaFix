import 'package:drift/drift.dart';
import '../table_constants.dart';
import '../uuid_instance.dart';

import 'suppliers_table.dart';
import 'pharmacies_table.dart';
import 'users_table.dart';

@DataClassName('PurchaseReturnDbModel')
class PurchaseReturnsTable extends Table {
  @override
  String get tableName => 'purchase_returns';

  // Primary Key
  TextColumn get id => text().clientDefault(() => uuid.v4()).named(TableConstants.colId)();

  // Foreign Keys
  TextColumn get pharmacyId => text().named(TableConstants.colPharmacyId).references(PharmaciesTable, #id)();
  TextColumn get purchaseInvoiceId => text().named(TableConstants.colPurchaseInvoiceId)(); // Assuming you have PurchaseInvoicesTable somewhere, otherwise keep it as text
  TextColumn get supplierId => text().named(TableConstants.colSupplierId).references(SuppliersTable, #id)();
  TextColumn get userId => text().named(TableConstants.colUserId).references(UsersTable, #id)();

  // Fields
  RealColumn get totalReturnValue => real().named(TableConstants.colTotalReturnValue)();

  // Timestamps & Sync
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).nullable()();
  DateTimeColumn get updatedAt => dateTime().named(TableConstants.colUpdatedAt).nullable()();
  BoolColumn get isSynced => boolean().named(TableConstants.colIsSynced).withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
