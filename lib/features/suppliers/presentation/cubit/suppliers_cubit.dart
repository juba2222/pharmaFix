// =============================================================
// File: lib/features/suppliers/presentation/cubit/suppliers_cubit.dart
// Purpose: Manages the list of suppliers and total debt.
// Layer: Presentation (Cubit)
// =============================================================

import 'dart:async';
import 'package:uuid/uuid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base/current_session.dart';
import '../../domain/entities/supplier_entity.dart';
import '../../domain/repositories/i_supplier_repository.dart';
import 'suppliers_state.dart';

class SuppliersCubit extends Cubit<SuppliersState> {
  final ISupplierRepository repository;
  final CurrentSession session;
  StreamSubscription? _subscription;
  final _uuid = const Uuid();

  SuppliersCubit({required this.repository, required this.session})
      : super(const SuppliersState.initial());

  void loadSuppliers({SupplierSortOption sortBy = SupplierSortOption.highestDebt}) {
    emit(const SuppliersState.loading());
    _subscription?.cancel();
    final pharmacyId = session.pharmacyId ?? '';
    _subscription = repository
        .watchAllSuppliers(pharmacyId, sortBy: sortBy)
        .listen(
          (suppliers) {
            final total = suppliers.fold(0.0, (sum, s) => sum + s.currentBalance);
            emit(SuppliersState.loaded(suppliers: suppliers, totalDebt: total));
          },
          onError: (e) => emit(SuppliersState.error(e.toString())),
        );
  }

  Future<void> addSupplier({
    required String name,
    String? company,
    String? phone,
    double openingBalance = 0.0,
  }) async {
    final pharmacyId = session.pharmacyId ?? '';
    final entity = SupplierEntity(
      id: _uuid.v4(),
      pharmacyId: pharmacyId,
      name: name,
      companyName: company,
      phone: phone,
      openingBalance: openingBalance,
      currentBalance: openingBalance,
      createdAt: DateTime.now(),
    );
    final res = await repository.addSupplier(entity);
    res.fold(
      (f) => emit(SuppliersState.error(f.message)),
      (_) => loadSuppliers(),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
