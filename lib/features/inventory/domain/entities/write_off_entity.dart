// =============================================================
// File: lib/features/inventory/domain/entities/write_off_entity.dart
// Purpose: Domain entity representing an inventory write-off.
// Layer: Domain (Inventory)
// =============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'write_off_entity.freezed.dart';
part 'write_off_entity.g.dart';

@freezed
abstract class WriteOffEntity with _$WriteOffEntity {
  const factory WriteOffEntity({
    required String id,
    required String pharmacyId,
    required String productId,
    required String batchId,
    required String unitId,
    required double quantity,
    required String reason,
    required DateTime createdAt,
  }) = _WriteOffEntity;

  factory WriteOffEntity.fromJson(Map<String, dynamic> json) =>
      _$WriteOffEntityFromJson(json);
}
