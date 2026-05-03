import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/error/failures.dart';
import '../entities/supplier_entity.dart';
import '../entities/supplier_statement_item.dart';
import '../repositories/i_supplier_repository.dart';

class SupplierRepositoryImpl implements ISupplierRepository {
  final AppDatabase _db;

  SupplierRepositoryImpl(this._db);

  @override
  Future<Either<Failure, int>> addSupplier(SupplierEntity supplier) async {
    try {
      final id = await _db.into(_db.suppliersTable).insert(
            SuppliersTableCompanion(
              pharmacyId: Value(supplier.pharmacyId),
              name: Value(supplier.name),
              companyName: Value(supplier.companyName),
              phone: Value(supplier.phone),
              openingBalance: Value(supplier.openingBalance),
              createdAt: Value(supplier.createdAt),
            ),
          );
      return Right(id);
    } catch (e) {
      return Left(DatabaseFailure('Failed to add supplier: $e'));
    }
  }

  @override
  Stream<List<SupplierEntity>> watchAllSuppliers(int pharmacyId) {
    // Custom query to calculate current_balance dynamically and sort by it
    final query = _db.customSelect(
      '''
      SELECT 
        s.id, s.pharmacy_id, s.name, s.company_name, s.phone, s.opening_balance, s.created_at,
        (s.opening_balance + 
         COALESCE((SELECT SUM(total_amount) FROM purchase_invoices WHERE supplier_id = s.id), 0.0) - 
         COALESCE((SELECT SUM(amount) FROM supplier_payments WHERE supplier_id = s.id), 0.0)) AS current_balance
      FROM suppliers s
      WHERE s.pharmacy_id = ?
      ORDER BY current_balance DESC
      ''',
      variables: [Variable.withInt(pharmacyId)],
      readsFrom: {
        _db.suppliersTable,
        _db.purchaseInvoicesTable,
        _db.supplierPaymentsTable,
      },
    );

    return query.watch().map((rows) {
      return rows.map((row) {
        return SupplierEntity(
          id: row.read<int>('id'),
          pharmacyId: row.read<int>('pharmacy_id'),
          name: row.read<String>('name'),
          companyName: row.read<String?>('company_name'),
          phone: row.read<String?>('phone'),
          openingBalance: row.read<double>('opening_balance'),
          currentBalance: row.read<double>('current_balance'),
          createdAt: row.read<DateTime>('created_at'),
        );
      }).toList();
    });
  }

  @override
  Future<Either<Failure, List<SupplierStatementItem>>> getSupplierStatement(int supplierId) async {
    try {
      final statementItems = <SupplierStatementItem>[];

      // 1. Get Opening Balance (treated as initial statement item if non-zero)
      final supplier = await (_db.select(_db.suppliersTable)..where((t) => t.id.equals(supplierId))).getSingle();
      if (supplier.openingBalance != 0) {
        statementItems.add(
          SupplierStatementItem(
            id: 0,
            type: StatementItemType.openingBalance,
            amount: supplier.openingBalance,
            date: supplier.createdAt,
            notes: 'الرصيد الافتتاحي',
          ),
        );
      }

      // 2. Get Purchase Invoices
      final invoices = await (_db.select(_db.purchaseInvoicesTable)..where((t) => t.supplierId.equals(supplierId))).get();
      for (final inv in invoices) {
        statementItems.add(
          SupplierStatementItem(
            id: inv.id,
            type: StatementItemType.invoice,
            amount: inv.totalAmount,
            date: inv.invoiceDate,
            referenceNumber: inv.invoiceNumber,
            notes: inv.notes,
          ),
        );
      }

      // 3. Get Payments
      final payments = await (_db.select(_db.supplierPaymentsTable)..where((t) => t.supplierId.equals(supplierId))).get();
      for (final pay in payments) {
        statementItems.add(
          SupplierStatementItem(
            id: pay.id,
            type: StatementItemType.payment,
            amount: pay.amount,
            date: pay.paymentDate,
            notes: pay.notes,
          ),
        );
      }

      // 4. Sort by date ascending
      statementItems.sort((a, b) => a.date.compareTo(b.date));

      return Right(statementItems);
    } catch (e) {
      return Left(DatabaseFailure('Failed to load supplier statement: $e'));
    }
  }
}
