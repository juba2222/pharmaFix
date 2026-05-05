// =============================================================
// File: lib/features/suppliers/data/repositories/supplier_repository_impl.dart
// Purpose: Implementation of ISupplierRepository.
// Layer: Data (Repository Implementation)
// Dependencies: drift, dartz, i_supplier_repository
// =============================================================

import 'package:dartz/dartz.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/supplier_entity.dart';
import '../../domain/entities/supplier_statement_item.dart';
import '../../domain/repositories/i_supplier_repository.dart';
import '../services/supplier_read_service.dart';
import '../services/supplier_write_service.dart';
import '../transactions/purchase_invoice_transaction.dart';
import '../transactions/cancel_purchase_invoice_transaction.dart';

class SupplierRepositoryImpl implements ISupplierRepository {
  final SupplierReadService _read;
  final SupplierWriteService _write;
  final AppDatabase _db;

  SupplierRepositoryImpl(this._db)
      : _read = SupplierReadService(_db),
        _write = SupplierWriteService(_db);

  @override
  Stream<List<SupplierEntity>> watchAllSuppliers(
    String pharmacyId, {
    SupplierSortOption sortBy = SupplierSortOption.highestDebt,
  }) =>
      _read.watchAll(pharmacyId, sortBy);

  @override
  Future<Either<Failure, String>> addSupplier(SupplierEntity supplier) async {
    try {
      await _write.addSupplier(
        supplier.pharmacyId,
        supplier.name,
        supplier.companyName,
        supplier.phone,
        supplier.openingBalance,
      );
      return Right(supplier.id);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getSupplierStats(String supplierId) async {
    try {
      return Right(await _read.getStats(supplierId));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SupplierStatementItem>>> getSupplierStatement(String supplierId) async {
    try {
      return Right(await _read.getStatement(supplierId));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getSupplierCatalog(String supplierId) async {
    try {
      return Right(await _read.getCatalog(supplierId));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> createPurchaseInvoice({
    required String supplierId,
    required String pharmacyId,
    required String? invoiceNumber,
    required DateTime date,
    required double totalAmount,
    required double paidAmount,
    double discountAmount = 0.0,
    required List<Map<String, dynamic>> items,
  }) async {
    try {
      await PurchaseInvoiceTransaction(_db).execute(
        supplierId: supplierId,
        pharmacyId: pharmacyId,
        invoiceNumber: invoiceNumber,
        date: date,
        totalAmount: totalAmount,
        paidAmount: paidAmount,
        discountAmount: discountAmount,
        items: items,
      );
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addSupplierPayment({
    required String supplierId,
    required String pharmacyId,
    required double amount,
    required DateTime date,
    String? invoiceId,
    String? notes,
  }) async {
    try {
      await _write.addPayment(pharmacyId, supplierId, amount, date, invoiceId, notes);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> cancelPurchaseInvoice(String invoiceId) async {
    try {
      final items = await CancelPurchaseInvoiceTransaction(_db).execute(invoiceId);
      return Right(items);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
