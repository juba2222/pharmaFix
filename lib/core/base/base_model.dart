// =============================================================
// File: lib/core/base/base_model.dart
// Purpose: Generic Base Model to ensure consistency between layers.
// Layer: Data (Core)
// =============================================================

import 'base_entity.dart';

abstract class BaseModel extends BaseEntity {
  const BaseModel({
    required super.id,
    required super.createdAt,
  });

  // Optional: Add common JSON or conversion methods here if needed.
}
