// =============================================================
// File: lib/core/base/base_state.dart
// Purpose: Standardized State Pattern for all Cubits/Blocs.
// Layer: Core (Base)
// =============================================================

import 'package:equatable/equatable.dart';
import '../error/failures.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

class InitialState extends BaseState {
  const InitialState();
}

class LoadingState extends BaseState {
  const LoadingState();
}

class SuccessState<T> extends BaseState {
  final T data;
  const SuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class ErrorState extends BaseState {
  final Failure failure;
  const ErrorState(this.failure);

  @override
  List<Object?> get props => [failure];
}
