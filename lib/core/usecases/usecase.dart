// =============================================================
// File: lib/core/usecases/usecase.dart
// Purpose: Base class for all Business Logic executions (UseCases).
// Layer: Core (Base)
// =============================================================

import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
