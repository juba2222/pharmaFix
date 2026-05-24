// =============================================================
// File: lib/features/customers/presentation/bloc/collection_cubit.dart
// Purpose: Cubit for handling payment collection logic and UI state.
// Layer: Presentation (BLoC)
// Dependencies: i_customer_repository.dart, collection_state.dart
// =============================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_customer_repository.dart';
import 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final ICustomerRepository _repository;
  final int _customerId;
  final int _pharmacyId;

  CollectionCubit({
    required ICustomerRepository repository,
    required int customerId,
    required int pharmacyId,
    required double currentBalance,
  })  : _repository = repository,
        _customerId = customerId,
        _pharmacyId = pharmacyId,
        super(CollectionState.initial(currentBalance: currentBalance));

  void amountChanged(double amount) {
    state.maybeWhen(
      initial: (balance, _, method, notes) => emit(CollectionState.initial(
        currentBalance: balance, amount: amount, method: method, notes: notes,
      )),
      orElse: () {},
    );
  }

  void methodChanged(String method) {
    state.maybeWhen(
      initial: (balance, amount, _, notes) => emit(CollectionState.initial(
        currentBalance: balance, amount: amount, method: method, notes: notes,
      )),
      orElse: () {},
    );
  }

  Future<void> submit() async {
    final currentState = state.maybeWhen(initial: (b, a, m, n) => [b, a, m, n], orElse: () => null);
    if (currentState == null) return;
    
    emit(const CollectionState.submitting());
    final res = await _repository.collectDebtPayment(
      customerId: _customerId, pharmacyId: _pharmacyId,
      amount: currentState[1] as double, date: DateTime.now(),
      notes: '${currentState[2]} - ${currentState[3]}',
    );
    
    res.fold(
      (f) => emit(CollectionState.failure(f.message)),
      (_) => emit(const CollectionState.success()),
    );
  }
}
