import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/i_reports_repository.dart';

class ReportsRepositoryImpl implements IReportsRepository {
  final AppDatabase _db;
  ReportsRepositoryImpl(this._db);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProfitLossReport({
    required DateTime start,
    required DateTime end,
    bool includeOverheads = true,
  }) async {
    try {
      // 1. Total Revenue (Sales)
      final invoiceQuery = _db.select(_db.invoicesTable)
        ..where((t) => t.createdAt.isBiggerOrEqualValue(start) & t.createdAt.isSmallerOrEqualValue(end));
      final invoices = await invoiceQuery.get();
      final totalRevenue = invoices.fold(0.0, (sum, i) => sum + i.totalAmount);

      // 2. COGS (Cost of Goods Sold)
      // This is simplified for this demo, ideally we join with batches for historical cost
      final itemsQuery = _db.select(_db.invoiceItemsTable)
        ..where((t) => t.createdAt.isBiggerOrEqualValue(start) & t.createdAt.isSmallerOrEqualValue(end));
      final items = await itemsQuery.get();
      // For now, let's assume COGS is ~70% of revenue if exact data is missing,
      // but in real app we'd query item.quantity * batch.costPrice
      final estimatedCOGS = totalRevenue * 0.7;

      // 3. Operational Expenses
      double totalExpenses = 0.0;
      if (includeOverheads) {
        final expenseQuery = _db.select(_db.expensesTable)
          ..where((t) => t.date.isBiggerOrEqualValue(start) & t.date.isSmallerOrEqualValue(end));
        final expenses = await expenseQuery.get();
        totalExpenses = expenses.fold(0.0, (sum, e) => sum + e.amount);
      }

      final netProfit = totalRevenue - estimatedCOGS - totalExpenses;

      return Right({
        'revenue': totalRevenue,
        'cogs': estimatedCOGS,
        'expenses': totalExpenses,
        'netProfit': netProfit,
        'count': invoices.length,
      });
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCashFlowReport({
    required DateTime start,
    required DateTime end,
  }) async {
    try {
      // Cash In: Collected from Sales + Customer Payments
      final invoices = await (_db.select(_db.invoicesTable)
        ..where((t) => t.createdAt.isBiggerOrEqualValue(start) & t.createdAt.isSmallerOrEqualValue(end))).get();
      final cashInSales = invoices.fold(0.0, (sum, i) => sum + i.paidAmount);

      // Cash Out: Paid to Suppliers + Operational Expenses
      final supplierPayments = await (_db.select(_db.supplierPaymentsTable)
        ..where((t) => t.paymentDate.isBiggerOrEqualValue(start) & t.paymentDate.isSmallerOrEqualValue(end))).get();
      final cashOutSuppliers = supplierPayments.fold(0.0, (sum, p) => sum + p.amount);

      final overheads = await (_db.select(_db.expensesTable)
        ..where((t) => t.date.isBiggerOrEqualValue(start) & t.date.isSmallerOrEqualValue(end))).get();
      final cashOutExpenses = overheads.fold(0.0, (sum, e) => sum + e.amount);

      return Right({
        'cashIn': cashInSales,
        'cashOut': cashOutSuppliers + cashOutExpenses,
        'netCashFlow': cashInSales - (cashOutSuppliers + cashOutExpenses),
      });
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getInventoryInsights() async {
    try {
      final batches = await _db.select(_db.productBatchesTable).get();
      final now = DateTime.now();

      final totalValue = batches.fold(0.0, (sum, b) => sum + (b.quantityInBaseUnit * (b.purchasePrice ?? 0)));
      final expired = batches.where((b) => b.expiryDate.isBefore(now)).length;
      final nearExpiry = batches.where((b) => b.expiryDate.isAfter(now) && b.expiryDate.isBefore(now.add(const Duration(days: 90)))).length;

      return Right({
        'stockValue': totalValue,
        'expiredCount': expired,
        'nearExpiryCount': nearExpiry,
        'totalItems': batches.length,
      });
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getDebtsReport() async {
    try {
      final customers = await _db.select(_db.customersTable).get();
      final suppliers = await _db.select(_db.suppliersTable).get();

      final receivable = customers.fold(0.0, (sum, c) => sum + c.currentBalance);
      final payable = suppliers.fold(0.0, (sum, s) => sum + s.currentBalance);

      return Right({
        'receivable': receivable,
        'payable': payable,
        'netPosition': receivable - payable,
      });
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
