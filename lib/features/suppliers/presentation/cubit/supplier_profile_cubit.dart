// =============================================================
// File: lib/features/suppliers/presentation/cubit/supplier_profile_cubit.dart
// Purpose: Loads and manages supplier profile data.
// Layer: Presentation (Cubit)
// =============================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base/current_session.dart';
import '../../domain/entities/supplier_statement_item.dart';
import '../../domain/repositories/i_supplier_repository.dart';
import 'supplier_profile_state.dart';

class SupplierProfileCubit extends Cubit<SupplierProfileState> {
  final ISupplierRepository _repository;
  final String _supplierId;
  // G3: Inject CurrentSession to get pharmacyId reliably
  final CurrentSession _session;

  SupplierProfileCubit({
    required ISupplierRepository repository,
    required String supplierId,
    required CurrentSession session,
  })  : _repository = repository,
        _supplierId = supplierId,
        _session = session,
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

  Future<void> cancelInvoice(String invoiceId,
      {Function(List<Map<String, dynamic>>)? onDraft}) async {
    final result = await _repository.cancelPurchaseInvoice(invoiceId);
    result.fold(
      (f) => loadProfile(),
      (items) {
        if (onDraft != null) onDraft(items);
        loadProfile();
      },
    );
  }

  Future<void> addPayment(double amount,
      {String? invoiceId, String? pharmacyId}) async {
    // G3: Use session pharmacyId, fall back to passed value
    final pid = _session.pharmacyId ?? pharmacyId ?? '';
    final res = await _repository.addSupplierPayment(
      supplierId: _supplierId,
      pharmacyId: pid,
      amount: amount,
      date: DateTime.now(),
      invoiceId: invoiceId,
    );
    res.fold((f) => null, (_) => loadProfile());
  }
}
