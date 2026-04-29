// =============================================================
// File: lib/features/customers/data/repositories/customer_repository_impl.dart
// Purpose: Implements ICustomerRepository using local Drift DB (offline-first).
// Layer: Data (Repository Implementation)
// =============================================================

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/database/app_database.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/customer_entity.dart';
import '../../domain/repositories/i_customer_repository.dart';
import '../models/customer_model.dart';

class CustomerRepositoryImpl implements ICustomerRepository {
  final AppDatabase _db;

  CustomerRepositoryImpl(this._db);

  @override
  Future<Either<Failure, List<CustomerEntity>>> searchCustomers(
    String query,
  ) async {
    try {
      final term = '%$query%';
      final rows = await (_db.select(_db.customersTable)
            ..where(
              (t) => t.name.like(term) | t.phone.like(term),
            ))
          .get();

      final entities = rows
          .map((r) => CustomerModel.fromDbModel(r).toEntity())
          .toList();

      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerEntity>> addCustomer({
    required String name,
    String? phone,
    int pharmacyId = 0, // Passed by caller; default 0 for safety
  }) async {
    try {
      final id = await _db.into(_db.customersTable).insert(
        CustomersTableCompanion.insert(
          name: name,
          phone: drift.Value(phone),
          pharmacyId: pharmacyId,
        ),
      );


      final newCustomer = CustomerModel(
        id: id,
        name: name,
        phone: phone,
        totalDebt: 0.0,
      );

      return Right(newCustomer.toEntity());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
