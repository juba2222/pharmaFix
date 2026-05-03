import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/supplier_entity.dart';
import '../entities/supplier_statement_item.dart';

enum SupplierSortOption { highestDebt, oldestDebt }

abstract class ISupplierRepository {
  /// Adds a new supplier.
  Future<Either<Failure, String>> addSupplier(SupplierEntity supplier);

  /// Watches all suppliers with sorting options.
  Stream<List<SupplierEntity>> watchAllSuppliers(String pharmacyId, {SupplierSortOption sortBy = SupplierSortOption.highestDebt});

  /// Retrieves a detailed statement of account for a specific supplier.
  Future<Either<Failure, List<SupplierStatementItem>>> getSupplierStatement(String supplierId);

  /// Retrieves summary stats for a supplier profile.
  Future<Either<Failure, Map<String, dynamic>>> getSupplierStats(String supplierId);

  /// Retrieves products previously purchased from this supplier.
  Future<Either<Failure, List<Map<String, dynamic>>>> getSupplierCatalog(String supplierId);
  
  /// Adds a payment to a supplier and updates their balance.
  Future<Either<Failure, Unit>> addSupplierPayment({
    required String supplierId,
    required String pharmacyId,
    required double amount,
    required DateTime date,
    String? notes,
  });

  /// Creates a purchase invoice, updates products, units, inventory batches, and supplier balance.
  Future<Either<Failure, Unit>> createPurchaseInvoice({
    required String supplierId,
    required String pharmacyId,
    required String? invoiceNumber,
    required DateTime date,
    required double totalAmount,
    required double paidAmount,
    required List<Map<String, dynamic>> items,
  });
}
