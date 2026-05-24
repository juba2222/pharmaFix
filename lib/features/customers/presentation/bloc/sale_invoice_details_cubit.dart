// =============================================================
// File: lib/features/customers/presentation/bloc/sale_invoice_details_cubit.dart
// Purpose: Cubit to fetch and manage details of a specific sale invoice.
// Layer: Presentation (BLoC)
// =============================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_customer_repository.dart';
import 'sale_invoice_details_state.dart';

class SaleInvoiceDetailsCubit extends Cubit<SaleInvoiceDetailsState> {
  final ICustomerRepository _repository;
  final String _invoiceId;

  SaleInvoiceDetailsCubit({
    required ICustomerRepository repository,
    required String invoiceId,
  })  : _repository = repository,
        _invoiceId = invoiceId,
        super(const SaleInvoiceDetailsState.initial());

  Future<void> loadInvoiceDetails() async {
    emit(const SaleInvoiceDetailsState.loading());
    final result = await _repository.getSaleInvoiceDetails(_invoiceId);
    result.fold(
      (f) => emit(SaleInvoiceDetailsState.failure(f.message)),
      (invoice) => emit(SaleInvoiceDetailsState.loaded(invoice)),
    );
  }
}
