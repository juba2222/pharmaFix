// =============================================================
// File: lib/features/customers/presentation/bloc/customer_profile_state.dart
// Purpose: States for the Customer Profile feature.
// Layer: Presentation (BLoC)
// =============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_profile_state.freezed.dart';

@freezed
class CustomerProfileState with _$CustomerProfileState {
  const factory CustomerProfileState.initial() = _Initial;
  const factory CustomerProfileState.loading() = _Loading;
  const factory CustomerProfileState.loaded({
    required double currentBalance,
    required double creditLimit,
    required double totalPurchases,
    DateTime? lastSale,
    required int invoiceCount,
    required List<Map<String, dynamic>> salesHistory,
  }) = _Loaded;
  const factory CustomerProfileState.error(String message) = _Error;
}
