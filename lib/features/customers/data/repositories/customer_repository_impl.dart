// =============================================================
// File: lib/features/customers/data/repositories/customer_repository_impl.dart
// Purpose: Implements ICustomerRepository using local Drift DB (offline-first).
// Layer: Data (Repository Implementation)
// =============================================================

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
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
  Stream<List<CustomerEntity>> watchAllCustomers(int pharmacyId, {CustomerSortOption sortBy = CustomerSortOption.highestDebt}) {
    final query = _db.select(_db.customersTable)..where((t) => t.pharmacyId.equals(pharmacyId));

    if (sortBy == CustomerSortOption.highestDebt) {
      query.orderBy([(t) => drift.OrderingTerm.desc(t.currentBalance)]);
    } else {
      // For oldest debt, we'd ideally join with invoices. For now, simple sorting.
      query.orderBy([(t) => drift.OrderingTerm.asc(t.createdAt)]);
    }

    return query.watch().map((rows) => rows.map((r) => CustomerModel.fromDbModel(r).toEntity()).toList());
  }

  @override
  Future<Either<Failure, CustomerEntity>> addCustomer({
    required String name,
    String? phone,
    double creditLimit = 0.0,
    int pharmacyId = 0,
  }) async {
    try {
      final id = await _db.into(_db.customersTable).insert(
        CustomersTableCompanion.insert(
          name: name,
          phone: drift.Value(phone),
          pharmacyId: pharmacyId,
          creditLimit: drift.Value(creditLimit),
        ),
      );

      final newCustomer = CustomerModel(
        id: id,
        name: name,
        phone: phone,
        creditLimit: creditLimit,
      );

      return Right(newCustomer.toEntity());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCustomerStats(int customerId) async {
    try {
      final customer = await (_db.select(_db.customersTable)..where((t) => t.id.equals(customerId))).getSingle();
      final invoices = await (_db.select(_db.invoicesTable)..where((t) => t.customerId.equals(customerId.toString()))).get();

      final totalPurchases = invoices.fold(0.0, (sum, i) => sum + i.totalAmount);
      final lastSale = invoices.isEmpty ? null : invoices.last.createdAt;

      return Right({
        'currentBalance': customer.currentBalance,
        'creditLimit': customer.creditLimit,
        'totalPurchases': totalPurchases,
        'lastSale': lastSale,
        'invoiceCount': invoices.length,
      });
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getCustomerSalesHistory(int customerId) async {
    try {
      final rows = await (_db.select(_db.invoicesTable)..where((t) => t.customerId.equals(customerId.toString()))).get();
      return Right(rows.map((r) => {
        'id': r.id,
        'total': r.totalAmount,
        'paid': r.paidAmount,
        'remaining': r.remainingAmount,
        'date': r.createdAt,
        'status': r.status,
      }).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> collectDebtPayment({
    required int customerId,
    required int pharmacyId,
    required double amount,
    required DateTime date,
    String? notes,
  }) async {
    try {
      await _db.transaction(() async {
        // 1. Record payment
        await _db.into(_db.customerPaymentsTable).insert(CustomerPaymentsTableCompanion.insert(
          id: Uuid().v4(),
          pharmacyId: pharmacyId.toString(),
          customerId: customerId,
          amount: amount,
          paymentDate: date,
          notes: notes == null ? const drift.Value.absent() : drift.Value(notes),
        ));

        // 2. FIFO Waterfall
        double remainingPayment = amount;
        final unpaidInvoices = await (_db.select(_db.invoicesTable)
          ..where((t) => t.customerId.equals(customerId.toString()) & t.remainingAmount.isBiggerThanValue(0.0))
          ..orderBy([(t) => drift.OrderingTerm.asc(t.createdAt)]))
          .get();

        for (final inv in unpaidInvoices) {
          if (remainingPayment <= 0) break;
          double toPay = remainingPayment >= inv.remainingAmount ? inv.remainingAmount : remainingPayment;

          await (_db.update(_db.invoicesTable)..where((t) => t.id.equals(inv.id))).write(InvoicesTableCompanion(
            remainingAmount: drift.Value(inv.remainingAmount - toPay),
            paidAmount: drift.Value(inv.paidAmount + toPay),
            status: drift.Value((inv.remainingAmount - toPay) <= 0 ? 'paid' : 'partial'),
          ));
          remainingPayment -= toPay;
        }

        // 3. Update Customer Balance
        final customer = await (_db.select(_db.customersTable)..where((t) => t.id.equals(customerId))).getSingle();
        await (_db.update(_db.customersTable)..where((t) => t.id.equals(customerId))).write(CustomersTableCompanion(
          currentBalance: drift.Value(customer.currentBalance - amount),
        ));
      });
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> processSaleReturn({
    required String invoiceId,
    required String itemId,
    required double quantity,
    required double refundAmount,
  }) async {
    // This requires complex logic involving Inventory and Invoices.
    // Placeholder for now as per "Step-by-Step" instructions.
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteCustomer(int customerId) async {
    try {
      final customer = await (_db.select(_db.customersTable)..where((t) => t.id.equals(customerId))).getSingle();
      if (customer.currentBalance > 0) {
        return Left(DatabaseFailure('لا يمكن حذف عميل لديه ديون عالقة (${customer.currentBalance} ر.س)'));
      }

      await (_db.delete(_db.customersTable)..where((t) => t.id.equals(customerId))).go();
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
