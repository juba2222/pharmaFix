// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_off_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WriteOffEntity _$WriteOffEntityFromJson(Map<String, dynamic> json) =>
    _WriteOffEntity(
      id: json['id'] as String,
      pharmacyId: json['pharmacyId'] as String,
      productId: json['productId'] as String,
      batchId: json['batchId'] as String,
      unitId: json['unitId'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      costPriceAtTime: (json['costPriceAtTime'] as num?)?.toDouble() ?? 0.0,
      reason: json['reason'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$WriteOffEntityToJson(_WriteOffEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pharmacyId': instance.pharmacyId,
      'productId': instance.productId,
      'batchId': instance.batchId,
      'unitId': instance.unitId,
      'quantity': instance.quantity,
      'costPriceAtTime': instance.costPriceAtTime,
      'reason': instance.reason,
      'createdAt': instance.createdAt.toIso8601String(),
    };
