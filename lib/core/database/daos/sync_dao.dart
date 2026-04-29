import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/products_table.dart';
import '../tables/invoices_table.dart';
import '../tables/product_batches_table.dart';
import '../tables/invoice_items_table.dart';

part 'sync_dao.g.dart';

@DriftAccessor(tables: [
  ProductsTable,
  InvoicesTable,
  ProductBatchesTable,
  InvoiceItemsTable,
])
class SyncDao extends DatabaseAccessor<AppDatabase> with _$SyncDaoMixin {
  SyncDao(super.db);

  // --- Products ---
  Future<int> insertProduct(ProductDbModel product) =>
      into(productsTable).insert(product, mode: InsertMode.insertOrReplace);

  Future<bool> updateProduct(ProductDbModel product) =>
      update(productsTable).replace(product);

  // --- Invoices ---
  Future<int> insertInvoice(InvoiceDbModel invoice) =>
      into(invoicesTable).insert(invoice, mode: InsertMode.insertOrReplace);

  Future<bool> updateInvoice(InvoiceDbModel invoice) =>
      update(invoicesTable).replace(invoice);

  // --- Batches ---
  Future<int> insertBatch(ProductBatchDbModel batch) =>
      into(productBatchesTable).insert(batch, mode: InsertMode.insertOrReplace);

  Future<bool> updateBatch(ProductBatchDbModel batch) =>
      update(productBatchesTable).replace(batch);

  // --- Invoice Items ---
  Future<int> insertInvoiceItem(InvoiceItemDbModel item) =>
      into(invoiceItemsTable).insert(item, mode: InsertMode.insertOrReplace);

  Future<bool> updateInvoiceItem(InvoiceItemDbModel item) =>
      update(invoiceItemsTable).replace(item);

  // --- Sync Helpers ---
  Future<List<ProductDbModel>> getUnsyncedProducts() =>
      (select(productsTable)..where((t) => t.isSynced.equals(false))).get();

  Future<List<InvoiceDbModel>> getUnsyncedInvoices() =>
      (select(invoicesTable)..where((t) => t.isSynced.equals(false))).get();
}

