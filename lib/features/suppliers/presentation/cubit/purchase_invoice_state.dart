import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_invoice_state.freezed.dart';

@freezed
class PurchaseInvoiceState with _$PurchaseInvoiceState {
  const factory PurchaseInvoiceState({
    @Default([]) List<Map<String, dynamic>> cartItems,
    @Default(0.0) double totalAmount,
    @Default(0.0) double paidAmount,
    @Default(false) bool isSaving,
    String? error,
    @Default(false) bool success,
  }) = _PurchaseInvoiceState;
}
