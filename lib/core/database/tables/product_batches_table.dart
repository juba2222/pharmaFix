import 'package:drift/drift.dart';
import '../table_constants.dart';

@DataClassName('ProductBatchDbModel')
class ProductBatchesTable extends Table {
  @override
  String get tableName => TableConstants.tableNameProductBatches;

  // Primary Key (UUID as Text)
  TextColumn get id => text().named(TableConstants.colId)();

  // Foreign Keys (UUID as Text)
  TextColumn get productId => text().named(TableConstants.colProductId)();
  TextColumn get pharmacyId => text().named(TableConstants.colPharmacyId)();

  // Fields
  TextColumn get batchNumber => text().named('batch_number')();
  DateTimeColumn get expiryDate => dateTime().named('expiry_date')();
  RealColumn get quantityInBaseUnit => real().named('quantity_in_base_unit')();
  RealColumn get purchasePrice => real().named('purchase_price').withDefault(const Constant(0.0))();
  TextColumn get purchaseInvoiceItemId => text().named('purchase_invoice_item_id').nullable()();


  // Timestamps & Sync
  DateTimeColumn get createdAt => dateTime().named(TableConstants.colCreatedAt).nullable()();
  DateTimeColumn get updatedAt => dateTime().named(TableConstants.colUpdatedAt).nullable()();
  BoolColumn get isSynced => boolean().named(TableConstants.colIsSynced).withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Index> get indexes => [];
}
