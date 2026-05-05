// =============================================================
// File: lib/features/suppliers/presentation/cubit/purchase_invoice_state.dart
// Purpose: State for the purchase invoice cubit (single data class).
// Layer: Presentation (State)
// =============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_invoice_state.freezed.dart';

@freezed
abstract class PurchaseInvoiceState with _$PurchaseInvoiceState {
  const factory PurchaseInvoiceState({
    @Default([]) List<Map<String, dynamic>> cartItems,
    @Default(0.0) double totalAmount,
    @Default(0.0) double paidAmount,
    @Default(0.0) double discountAmount,
    @Default(false) bool isSaving,
    String? error,
    @Default(false) bool success,
  }) = _PurchaseInvoiceState;

  /// Convenience factory — returns a state with all defaults.
  factory PurchaseInvoiceState.initial() => const PurchaseInvoiceState();
}
