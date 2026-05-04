// =============================================================
// File: lib/features/suppliers/domain/entities/supplier_entity.dart
// Purpose: Entity representing a Supplier record.
// Layer: Domain (Entity)
// Dependencies: freezed
// =============================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_entity.freezed.dart';
part 'supplier_entity.g.dart';

@freezed
abstract class SupplierEntity with _$SupplierEntity {
  const factory SupplierEntity({
    required String id,
    required String pharmacyId,
    required String name,
    String? companyName,
    String? phone,
    required double openingBalance,
    @Default(0.0) double currentBalance,
    required DateTime createdAt,
  }) = _SupplierEntity;

  factory SupplierEntity.fromJson(Map<String, dynamic> json) =>
      _$SupplierEntityFromJson(json);
}
