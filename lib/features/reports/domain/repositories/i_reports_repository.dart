import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class IReportsRepository {
  /// Financial P&L: Net Profit, Revenue, COGS, and Expenses.
  Future<Either<Failure, Map<String, dynamic>>> getProfitLossReport({
    required DateTime start,
    required DateTime end,
    bool includeOverheads = true,
  });

  /// Cash Flow: Cash IN vs Cash OUT.
  Future<Either<Failure, Map<String, dynamic>>> getCashFlowReport({
    required DateTime start,
    required DateTime end,
  });

  /// Inventory Insights: Value, Movement, and Expiry.
  Future<Either<Failure, Map<String, dynamic>>> getInventoryInsights();

  /// Debts: Accounts Receivable and Payable.
  Future<Either<Failure, Map<String, dynamic>>> getDebtsReport();
}
