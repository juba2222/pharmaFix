// =============================================================
// File: lib/core/database/app_database.dart
// Purpose: The main Database file. Adheres to relational ERD.
// Layer: Core (Database)
// =============================================================

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'uuid_instance.dart';


import 'tables/products_table.dart';
import 'tables/product_units_table.dart';
import 'tables/product_batches_table.dart';
import 'tables/pharmacies_table.dart';
import 'tables/users_table.dart';
import 'tables/customers_table.dart';
import 'tables/categories_table.dart';
import 'tables/manufacturers_table.dart';
import 'tables/suppliers_table.dart';
import 'tables/supplier_payments_table.dart';
import 'tables/purchase_invoices_table.dart';
import 'tables/purchase_invoice_items_table.dart';
import 'tables/write_offs_table.dart';

import 'tables/cash_sessions_table.dart';
import 'tables/invoices_table.dart';
import 'tables/invoice_items_table.dart';
import 'tables/returns_table.dart';
import 'tables/return_items_table.dart';
import 'tables/audit_logs_table.dart';
import 'tables/payments_table.dart';
import 'tables/customer_payments_table.dart';
import 'tables/master_drugs_table.dart';
import 'daos/sync_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    PharmaciesTable,
    UsersTable,
    CustomersTable,
    CategoriesTable,
    ManufacturersTable,
    SuppliersTable,
    SupplierPaymentsTable,
    PurchaseInvoicesTable,
    ProductsTable,
    ProductUnitsTable,
    ProductBatchesTable,
    CashSessionsTable,
    InvoicesTable,
    InvoiceItemsTable,
    ReturnsTable,
    ReturnItemsTable,
    AuditLogsTable,
    PaymentsTable,
    MasterDrugsTable,
    MasterUnitsTable,
    PurchaseInvoiceItemsTable,
    WriteOffsTable,
    CustomerPaymentsTable,
  ],

  daos: [SyncDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Following the ERD carefully.
  @override
  int get schemaVersion => 10; // Added costPriceAtTime to WriteOffs


  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 8) {

            // Drop existing tables and recreate for this major refactor
            // In a production app, we would use proper migrations, but for this refactor phase, 
            // we ensure the schema is in sync with the ERD.
            for (final table in allTables) {
              try {
                await m.deleteTable(table.actualTableName);
              } catch (_) {}
              try {
                await m.createTable(table);
              } catch (_) {}
            }
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pharmafix.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
