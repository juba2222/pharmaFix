import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class IReportsRepository {
  /// Revenue Report: total sales, returns, and net revenue.
  Future<Either<Failure, Map<String, dynamic>>> getRevenueReport({DateTime? start, DateTime? end});

  /// Expense Report: write-offs, supplier payments, and overheads.
  Future<Either<Failure, Map<String, dynamic>>> getExpenseReport({DateTime? start, DateTime? end});

  /// Customer Debt Report: list of customers with their debt and purchase power.
  Future<Either<Failure, List<Map<String, dynamic>>>> getCustomersReport();

  /// Supplier Debt Report: list of suppliers with total purchases and remaining debt.
  Future<Either<Failure, List<Map<String, dynamic>>>> getSuppliersReport();

  /// Inventory Health Report: expired batches, low stock items, and stock value.
  Future<Either<Failure, Map<String, dynamic>>> getInventoryReport();
}
