// =============================================================
// File: lib/core/base/base_entity.dart
// Purpose: Base class that ALL Domain Entities must extend.
//          Provides shared fields: id and createdAt.
// Layer: Domain (Core — shared across all features)
// Dependencies: equatable
// =============================================================

import 'package:equatable/equatable.dart';

// 'abstract' means this class cannot be used directly —
// it is a blueprint that other Entities must build upon.
abstract class BaseEntity extends Equatable {
  // Every record in the system has a unique UUID String
  final String id;

  // When was this record created?
  final DateTime createdAt;

  const BaseEntity({
    required this.id,
    required this.createdAt,
  });
}
