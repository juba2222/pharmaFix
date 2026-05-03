// =============================================================
// File: lib/features/suppliers/presentation/cubit/suppliers_cubit.dart
// Purpose: Manages the list of suppliers and total debt.
// Layer: Presentation (Cubit)
// =============================================================

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/current_session.dart';
import '../../domain/repositories/i_supplier_repository.dart';
import 'suppliers_state.dart';

class SuppliersCubit extends Cubit<SuppliersState> {
  final ISupplierRepository repository;
  final CurrentSession session;
  StreamSubscription? _subscription;

  SuppliersCubit({required this.repository, required this.session}) : super(const SuppliersState.initial());

  void loadSuppliers({SupplierSortOption sortOption = SupplierSortOption.highestDebt}) {
    emit(const SuppliersState.loading());
    _subscription?.cancel();
    _subscription = repository.watchAllSuppliers(sortOption: sortOption).listen((suppliers) {
      final total = suppliers.fold(0.0, (sum, s) => sum + s.currentBalance);
      emit(SuppliersState.loaded(suppliers: suppliers, totalDebt: total));
    }, onError: (e) => emit(SuppliersState.error(e.toString())));
  }

  Future<void> addSupplier(String name, String? co, String? ph, double bal) async {
    final pharmacyId = session.pharmacyId ?? '';
    final res = await repository.addSupplier(pharmacyId, name, co, ph, bal);
    res.fold((f) => emit(SuppliersState.error(f.message)), (_) => loadSuppliers());
  }

  @override
  Future<void> close() { _subscription?.cancel(); return super.close(); }
}
