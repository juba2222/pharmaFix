// =============================================================
// File: lib/features/customers/domain/repositories/i_customer_repository.dart
// Purpose: Abstract contract for all customer data operations.
// Layer: Domain (Interface — no implementations here)
// =============================================================

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/customer_entity.dart';

abstract class ICustomerRepository {
  /// Search customers locally by name or phone fragment.
  Future<Either<Failure, List<CustomerEntity>>> searchCustomers(String query);

  /// Quick-add a new customer locally and return the created entity.
  Future<Either<Failure, CustomerEntity>> addCustomer({
    required String name,
    String? phone,
    int pharmacyId = 0,
  });
}
