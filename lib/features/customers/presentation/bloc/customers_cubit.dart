import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_customer_repository.dart';
import 'customers_state.dart';

class CustomersCubit extends Cubit<CustomersState> {
  final ICustomerRepository _repository;
  final int pharmacyId;

  CustomersCubit({required ICustomerRepository repository, required this.pharmacyId})
      : _repository = repository,
        super(const CustomersState.initial());

  void loadCustomers({CustomerSortOption sortBy = CustomerSortOption.highestDebt}) {
    emit(const CustomersState.loading());
    _repository.watchAllCustomers(pharmacyId, sortBy: sortBy).listen((customers) {
      final totalDebt = customers.fold(0.0, (sum, c) => sum + c.currentBalance);
      emit(CustomersState.loaded(customers: customers, totalMarketDebt: totalDebt));
    });
  }

  Future<void> addCustomer(String name, String? phone, double creditLimit) async {
    final result = await _repository.addCustomer(
      name: name,
      phone: phone,
      creditLimit: creditLimit,
      pharmacyId: pharmacyId,
    );
    result.fold(
      (f) => emit(CustomersState.error(f.message)),
      (_) => loadCustomers(),
    );
  }
}
