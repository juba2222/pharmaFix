// =============================================================
// File: lib/features/suppliers/domain/entities/supplier_entity.dart
// Purpose: Entity representing a Supplier record.
// Layer: Domain (Entity)
// Dependencies: freezed, BaseEntity
// =============================================================

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/base/base_entity.dart';

part 'supplier_entity.freezed.dart';
part 'supplier_entity.g.dart';

@freezed
class SupplierEntity extends BaseEntity with _$SupplierEntity {
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

  const SupplierEntity._() : super(id: '', createdAt: DateTime.now()); // Temporary base call for Freezed

  factory SupplierEntity.fromJson(Map<String, dynamic> json) =>
      _$SupplierEntityFromJson(json);

  @override
  List<Object?> get props => [id, pharmacyId, name, companyName, phone, openingBalance, currentBalance, createdAt];
}
