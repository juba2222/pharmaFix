import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/supplier_entity.dart';
import '../entities/supplier_statement_item.dart';

abstract class ISupplierRepository {
  /// Adds a new supplier.
  Future<Either<Failure, int>> addSupplier(SupplierEntity supplier);

  /// Watches all suppliers for the active pharmacy, ordered by highest debt.
  Stream<List<SupplierEntity>> watchAllSuppliers(int pharmacyId);

  /// Retrieves a detailed statement of account for a specific supplier.
  Future<Either<Failure, List<SupplierStatementItem>>> getSupplierStatement(int supplierId);
}
