// =============================================================
// File: lib/features/suppliers/data/services/supplier_read_service.dart
// Purpose: Handles read operations for suppliers from Drift.
// Layer: Data (Service)
// Dependencies: drift, i_supplier_repository
// =============================================================

import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/supplier_entity.dart';
import '../../domain/entities/supplier_statement_item.dart';
import '../../domain/repositories/i_supplier_repository.dart';
import '../mappers/supplier_mappers.dart';

class SupplierReadService {
  final AppDatabase db;
  SupplierReadService(this.db);

  Stream<List<SupplierEntity>> watchAll(String pharmacyId, SupplierSortOption sort) {
    final query = db.select(db.suppliersTable)
      ..where((t) => t.pharmacyId.equals(pharmacyId));
    if (sort == SupplierSortOption.highestDebt) {
      query.orderBy([(t) => OrderingTerm(expression: t.currentBalance, mode: OrderingMode.desc)]);
    } else {
      // Smart Sorting: Oldest Debt
      // Join with invoices to find the oldest unpaid invoice date
      return (db.select(db.suppliersTable).join([
        leftOuterJoin(
          db.purchaseInvoicesTable,
          db.purchaseInvoicesTable.supplierId.equalsExp(db.suppliersTable.id) &
              db.purchaseInvoicesTable.remainingAmount.isBiggerThanValue(0.0),
        ),
      ])
            ..where(db.suppliersTable.pharmacyId.equals(pharmacyId))
            ..orderBy([
              OrderingTerm(
                  expression: db.purchaseInvoicesTable.invoiceDate,
                  mode: OrderingMode.asc)
            ]))
          .watch()
          .map((rows) {
        // Group by supplier to avoid duplicates from join
        final Map<String, SupplierEntity> suppliers = {};
        for (final row in rows) {
          final sTable = row.readTable(db.suppliersTable);
          if (!suppliers.containsKey(sTable.id)) {
            suppliers[sTable.id] = SupplierMappers.fromTable(sTable);
          }
        }
        return suppliers.values.toList();
      });
    }
    return query.watch().map((rows) =>
        rows.map((r) => SupplierMappers.fromTable(r)).toList());
  }

  Future<Map<String, dynamic>> getStats(String supplierId) async {
    final invoices = await (db.select(db.purchaseInvoicesTable)
          ..where((t) => t.supplierId.equals(supplierId)))
        .get();
    final supplier = await (db.select(db.suppliersTable)
          ..where((t) => t.id.equals(supplierId)))
        .getSingle();
    return {
      'totalPurchases': invoices.fold(0.0, (sum, item) => sum + item.totalAmount),
      'currentDebt': supplier.currentBalance,
      'invoiceCount': invoices.length,
    };
  }

  Future<List<SupplierStatementItem>> getStatement(String supplierId) async {
    final rows = await (db.select(db.purchaseInvoicesTable)
          ..where((t) => t.supplierId.equals(supplierId)))
        .get();
    return rows.map((r) => SupplierMappers.invoiceToStatementItem(r)).toList();
  }

  Future<List<Map<String, dynamic>>> getCatalog(String supplierId) async {
    final query = db.select(db.purchaseInvoiceItemsTable).join([
      innerJoin(db.productsTable,
          db.productsTable.id.equalsExp(db.purchaseInvoiceItemsTable.productId)),
      innerJoin(db.purchaseInvoicesTable,
          db.purchaseInvoicesTable.id.equalsExp(db.purchaseInvoiceItemsTable.purchaseInvoiceId)),
    ])
      ..where(db.purchaseInvoicesTable.supplierId.equals(supplierId));
    final rows = await query.get();
    return rows.map((r) => {
          'id': r.readTable(db.productsTable).id,
          'name': r.readTable(db.productsTable).localName,
          'barcode': r.readTable(db.productsTable).barcode,
        }).toList();
  }
}
