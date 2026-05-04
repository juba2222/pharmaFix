// =============================================================
// File: lib/features/suppliers/data/mappers/supplier_mappers.dart
// Purpose: Converts Drift DB rows to Domain entities for suppliers.
// Layer: Data (Mapper)
// Dependencies: app_database, supplier_entity, supplier_statement_item
// =============================================================

import '../../../../core/database/app_database.dart';
import '../../domain/entities/supplier_entity.dart';
import '../../domain/entities/supplier_statement_item.dart';

class SupplierMappers {
  static SupplierEntity fromTable(SupplierDbModel r) {
    return SupplierEntity(
      id: r.id,
      pharmacyId: r.pharmacyId,
      name: r.name,
      companyName: r.companyName,
      phone: r.phone,
      openingBalance: r.openingBalance,
      currentBalance: r.currentBalance,
      createdAt: r.createdAt,
    );
  }

  static SupplierStatementItem invoiceToStatementItem(
      PurchaseInvoiceDbModel r) {
    return SupplierStatementItem(
      id: r.id,
      type: StatementItemType.invoice,
      amount: r.totalAmount,
      date: r.invoiceDate,
      referenceNumber: r.invoiceNumber,
    );
  }
}
