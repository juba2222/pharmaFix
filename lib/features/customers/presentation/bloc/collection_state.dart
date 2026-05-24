// =============================================================
// File: lib/features/customers/presentation/bloc/collection_state.dart
// Purpose: States for the Payment Collection process.
// Layer: Presentation (BLoC)
// =============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_state.freezed.dart';

@freezed
class CollectionState with _$CollectionState {
  const factory CollectionState.initial({
    required double currentBalance,
    @Default(0.0) double amount,
    @Default('cash') String method,
    @Default('') String notes,
  }) = _Initial;
  
  const factory CollectionState.submitting() = _Submitting;
  const factory CollectionState.success() = _Success;
  const factory CollectionState.failure(String message) = _Failure;
}
