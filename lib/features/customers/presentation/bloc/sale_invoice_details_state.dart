// =============================================================
// File: lib/features/customers/presentation/bloc/sale_invoice_details_state.dart
// Purpose: States for the Sale Invoice Details screen.
// Layer: Presentation (BLoC)
// =============================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sale_invoice_entity.dart';

part 'sale_invoice_details_state.freezed.dart';

@freezed
class SaleInvoiceDetailsState with _$SaleInvoiceDetailsState {
  const factory SaleInvoiceDetailsState.initial() = _Initial;
  const factory SaleInvoiceDetailsState.loading() = _Loading;
  const factory SaleInvoiceDetailsState.loaded(SaleInvoiceEntity invoice) = _Loaded;
  const factory SaleInvoiceDetailsState.failure(String message) = _Failure;
}
