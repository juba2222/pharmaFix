// =============================================================
// File: lib/features/customers/presentation/bloc/customer_profile_cubit.dart
// Purpose: Cubit for managing individual customer profile state.
// Layer: Presentation (BLoC)
// =============================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_customer_repository.dart';
import 'customer_profile_state.dart';

class CustomerProfileCubit extends Cubit<CustomerProfileState> {
  final ICustomerRepository _repository;
  final int _customerId;
  final int pharmacyId;

  CustomerProfileCubit({
    required ICustomerRepository repository,
    required int customerId,
    required this.pharmacyId,
  })  : _repository = repository,
        _customerId = customerId,
        super(const CustomerProfileState.initial());

  Future<void> loadProfile() async {
    emit(const CustomerProfileState.loading());
    final stats = await _repository.getCustomerStats(_customerId);
    final hist = await _repository.getCustomerSalesHistory(_customerId);
    
    stats.fold(
      (f) => emit(CustomerProfileState.error(f.message)),
      (s) => hist.fold(
        (f) => emit(CustomerProfileState.error(f.message)),
        (h) => emit(CustomerProfileState.loaded(
          currentBalance: s['currentBalance'], creditLimit: s['creditLimit'],
          totalPurchases: s['totalPurchases'], lastSale: s['lastSale'],
          invoiceCount: s['invoiceCount'], salesHistory: h,
        )),
      ),
    );
  }

  Future<void> collectPayment(double amount, String? notes) async {
    final res = await _repository.collectDebtPayment(
      customerId: _customerId, pharmacyId: pharmacyId,
      amount: amount, date: DateTime.now(), notes: notes,
    );
    res.fold((f) => emit(CustomerProfileState.error(f.message)), (_) => loadProfile());
  }
}
