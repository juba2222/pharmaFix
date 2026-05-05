import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/i_reports_repository.dart';

class ReportsRepositoryImpl implements IReportsRepository {
  final AppDatabase _db;
  ReportsRepositoryImpl(this._db);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getRevenueReport({DateTime? start, DateTime? end}) async {
    try {
      final query = _db.select(_db.invoicesTable);
      if (start != null) query.where((t) => t.createdAt.isBiggerOrEqualValue(start));
      if (end != null) query.where((t) => t.createdAt.isSmallerOrEqualValue(end));

      final invoices = await query.get();
      final totalSales = invoices.fold(0.0, (sum, i) => sum + i.totalAmount);
      final totalCollected = invoices.fold(0.0, (sum, i) => sum + i.paidAmount);
      final totalDebt = totalSales - totalCollected;

      return Right({
        'totalSales': totalSales,
        'totalCollected': totalCollected,
        'totalDebtGenerated': totalDebt,
        'count': invoices.length,
      });
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getExpenseReport({DateTime? start, DateTime? end}) async {
    try {
      final writeOffs = await _db.select(_db.writeOffsTable).get();
      final totalLosses = writeOffs.fold(0.0, (sum, w) => sum + (w.quantity * w.costPriceAtTime));

      final payments = await _db.select(_db.supplierPaymentsTable).get();
      final totalPaidToSuppliers = payments.fold(0.0, (sum, p) => sum + p.amount);

      return Right({
        'totalLosses': totalLosses,
        'paidToSuppliers': totalPaidToSuppliers,
        'totalExpenses': totalLosses + totalPaidToSuppliers,
      });
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getCustomersReport() async {
    try {
      final customers = await _db.select(_db.customersTable).get();
      return Right(customers.map((c) => {
        'name': c.name,
        'debt': c.currentBalance,
        'phone': c.phone,
      }).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getSuppliersReport() async {
    try {
      final suppliers = await _db.select(_db.suppliersTable).get();
      return Right(suppliers.map((s) => {
        'name': s.name,
        'debt': s.currentBalance,
        'company': s.companyName,
      }).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getInventoryReport() async {
    try {
      final now = DateTime.now();
      final batches = await _db.select(_db.productBatchesTable).get();

      final expired = batches.where((b) => b.expiryDate.isBefore(now)).length;
      final nearExpiry = batches.where((b) => b.expiryDate.isAfter(now) && b.expiryDate.isBefore(now.add(const Duration(days: 90)))).length;
      final totalValue = batches.fold(0.0, (sum, b) => sum + (b.quantityInBaseUnit * (b.purchasePrice ?? 0.0)));

      return Right({
        'expiredCount': expired,
        'nearExpiryCount': nearExpiry,
        'stockValue': totalValue,
        'totalBatches': batches.length,
      });
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
