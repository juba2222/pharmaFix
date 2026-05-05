// =============================================================
// File: lib/features/suppliers/presentation/cubit/supplier_profile_cubit.dart
// Purpose: Loads and manages supplier profile data.
// Layer: Presentation (Cubit)
// =============================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/supplier_statement_item.dart';
import '../../domain/repositories/i_supplier_repository.dart';
import 'supplier_profile_state.dart';

class SupplierProfileCubit extends Cubit<SupplierProfileState> {
  final ISupplierRepository _repository;
  final String _supplierId;

  SupplierProfileCubit({
    required ISupplierRepository repository,
    required String supplierId,
  })  : _repository = repository,
        _supplierId = supplierId,
        super(const SupplierProfileState.initial());

  Future<void> loadProfile() async {
    emit(const SupplierProfileState.loading());

    final statsResult = await _repository.getSupplierStats(_supplierId);
    final stmtResult = await _repository.getSupplierStatement(_supplierId);
    final catalogResult = await _repository.getSupplierCatalog(_supplierId);

    statsResult.fold(
      (f) => emit(SupplierProfileState.error(f.message)),
      (stats) => stmtResult.fold(
        (f) => emit(SupplierProfileState.error(f.message)),
        (items) => catalogResult.fold(
          (f) => emit(SupplierProfileState.error(f.message)),
          (catalog) => emit(SupplierProfileState.loaded(
            currentDebt: (stats['currentDebt'] as num?)?.toDouble() ?? 0.0,
            totalPurchases: (stats['totalPurchases'] as num?)?.toDouble() ?? 0.0,
            invoiceCount: (stats['invoiceCount'] as int?) ?? 0,
            invoices: items
                .where((i) => i.type == StatementItemType.invoice)
                .toList(),
            catalog: catalog,
          )),
        ),
      ),
    );
  }

  Future<void> cancelInvoice(String invoiceId, {Function(List<Map<String, dynamic>>)? onDraft}) async {
    final result = await _repository.cancelPurchaseInvoice(invoiceId);
    result.fold(
      (f) {
        loadProfile();
      },
      (items) {
        if (onDraft != null) onDraft(items);
        loadProfile();
      },
    );
  }

  Future<void> addPayment(double amount, {String? invoiceId, String? pharmacyId}) async {
    final res = await _repository.addSupplierPayment(
      supplierId: _supplierId,
      pharmacyId: pharmacyId ?? '', // Handle via session or pass from UI
      amount: amount,
      date: DateTime.now(),
      invoiceId: invoiceId,
    );
    res.fold(
      (f) => null, // Handle error
      (_) => loadProfile(),
    );
  }
}
