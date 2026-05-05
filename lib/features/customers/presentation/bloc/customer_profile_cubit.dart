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
    final statsRes = await _repository.getCustomerStats(_customerId);
    final historyRes = await _repository.getCustomerSalesHistory(_customerId);

    statsRes.fold(
      (f) => emit(CustomerProfileState.error(f.message)),
      (stats) => historyRes.fold(
        (f) => emit(CustomerProfileState.error(f.message)),
        (history) => emit(CustomerProfileState.loaded(
          currentBalance: stats['currentBalance'],
          creditLimit: stats['creditLimit'],
          totalPurchases: stats['totalPurchases'],
          lastSale: stats['lastSale'],
          invoiceCount: stats['invoiceCount'],
          salesHistory: history,
        )),
      ),
    );
  }

  Future<void> collectPayment(double amount, String? notes) async {
    final res = await _repository.collectDebtPayment(
      customerId: _customerId,
      pharmacyId: pharmacyId,
      amount: amount,
      date: DateTime.now(),
      notes: notes,
    );
    res.fold(
      (f) => emit(CustomerProfileState.error(f.message)),
      (_) => loadProfile(),
    );
  }
}
