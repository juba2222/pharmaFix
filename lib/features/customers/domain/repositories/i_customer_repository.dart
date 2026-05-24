// =============================================================
// File: lib/features/customers/domain/repositories/i_customer_repository.dart
// Purpose: Abstract contract for all customer data operations.
// Layer: Domain (Interface — no implementations here)
// =============================================================

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/customer_entity.dart';
import '../entities/sale_invoice_entity.dart';

enum CustomerSortOption { highestDebt, oldestDebt }

abstract class ICustomerRepository {
  /// Watches all customers with sorting.
  Stream<List<CustomerEntity>> watchAllCustomers(int pharmacyId, {CustomerSortOption sortBy = CustomerSortOption.highestDebt});

  /// Search customers locally by name or phone fragment.
  Future<Either<Failure, List<CustomerEntity>>> searchCustomers(String query);

  /// Quick-add a new customer locally and return the created entity.
  Future<Either<Failure, CustomerEntity>> addCustomer({
    required String name,
    String? phone,
    double creditLimit = 0.0,
    int pharmacyId = 0,
  });

  /// Get detailed stats for a customer.
  Future<Either<Failure, Map<String, dynamic>>> getCustomerStats(int customerId);

  /// Get sales history for a customer.
  Future<Either<Failure, List<Map<String, dynamic>>>> getCustomerSalesHistory(int customerId);

  /// Process a debt payment from a customer (Waterfall/FIFO).
  Future<Either<Failure, Unit>> collectDebtPayment({
    required int customerId,
    required int pharmacyId,
    required double amount,
    required DateTime date,
    String? notes,
  });

  /// Process a sale return for a customer.
  Future<Either<Failure, Unit>> processSaleReturn({
    required String invoiceId,
    required String itemId,
    required double quantity,
    required double refundAmount,
  });

  /// Get full details of a specific sale invoice.
  Future<Either<Failure, SaleInvoiceEntity>> getSaleInvoiceDetails(String invoiceId);

  /// Delete a customer (restricted if they have debt).
  Future<Either<Failure, Unit>> deleteCustomer(int customerId);
}
