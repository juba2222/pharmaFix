// =============================================================
// File: lib/features/suppliers/data/repositories/supplier_repository_impl.dart
// Purpose: Implementation of ISupplierRepository. Uses services for operations.
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

class SupplierRepositoryImpl implements ISupplierRepository {
  final SupplierReadService _read;
  final SupplierWriteService _write;
  final AppDatabase _db;

  SupplierRepositoryImpl(this._db)
      : _read = SupplierReadService(_db),
        _write = SupplierWriteService(_db);

  @override
  Stream<List<SupplierEntity>> watchAllSuppliers({SupplierSortOption sortOption = SupplierSortOption.highestDebt}) => _read.watchAll(sortOption);

  @override
  Future<Either<Failure, Unit>> addSupplier(String phId, String name, String? co, String? ph, double bal) async {
    try { await _write.addSupplier(phId, name, co, ph, bal); return const Right(unit); }
    catch (e) { return Left(DatabaseFailure(e.toString())); }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getSupplierProfileStats(String id) async {
    try { return Right(await _read.getStats(id)); }
    catch (e) { return Left(DatabaseFailure(e.toString())); }
  }

  @override
  Future<Either<Failure, List<SupplierStatementItem>>> getSupplierAccountStatement(String id) async {
    try { return Right(await _read.getStatement(id)); }
    catch (e) { return Left(DatabaseFailure(e.toString())); }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getSupplierCatalog(String id) async {
    try { return Right(await _read.getCatalog(id)); }
    catch (e) { return Left(DatabaseFailure(e.toString())); }
  }

  @override
  Future<Either<Failure, Unit>> createPurchaseInvoice({required String supplierId, required String pharmacyId, String? invoiceNumber, required double totalAmount, required double paidAmount, required List<Map<String, dynamic>> items}) async {
    try {
      await PurchaseInvoiceTransaction(_db).execute(supplierId: supplierId, pharmacyId: pharmacyId, invoiceNumber: invoiceNumber, date: DateTime.now(), totalAmount: totalAmount, paidAmount: paidAmount, items: items);
      return const Right(unit);
    } catch (e) { return Left(DatabaseFailure(e.toString())); }
  }

  @override
  Future<Either<Failure, Unit>> addSupplierPayment(String phId, String sId, double amt, String? n) async {
    try { await _write.addPayment(phId, sId, amt, n); return const Right(unit); }
    catch (e) { return Left(DatabaseFailure(e.toString())); }
  }
}
