import 'package:flutter_bloc/flutter_bloc.dart';
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
    final invoicesResult = await _repository.getSupplierStatement(_supplierId);
    final catalogResult = await _repository.getSupplierCatalog(_supplierId);

    statsResult.fold(
      (f) => emit(SupplierProfileState.error(f.message)),
      (stats) {
        invoicesResult.fold(
          (f) => emit(SupplierProfileState.error(f.message)),
          (invoices) {
            catalogResult.fold(
              (f) => emit(SupplierProfileState.error(f.message)),
              (catalog) {
                emit(SupplierProfileState.loaded(
                  currentDebt: stats['currentDebt'],
                  totalPurchases: stats['totalPurchases'],
                  invoiceCount: stats['invoiceCount'],
                  invoices: invoices.where((i) => i.type == StatementItemType.invoice).toList(),
                  catalog: catalog,
                ));
              },
            );
          },
        );
      },
    );
  }
}
