// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplierEntity _$SupplierEntityFromJson(Map<String, dynamic> json) =>
    _SupplierEntity(
      id: json['id'] as String,
      pharmacyId: json['pharmacyId'] as String,
      name: json['name'] as String,
      companyName: json['companyName'] as String?,
      phone: json['phone'] as String?,
      openingBalance: (json['openingBalance'] as num).toDouble(),
      currentBalance: (json['currentBalance'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SupplierEntityToJson(_SupplierEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pharmacyId': instance.pharmacyId,
      'name': instance.name,
      'companyName': instance.companyName,
      'phone': instance.phone,
      'openingBalance': instance.openingBalance,
      'currentBalance': instance.currentBalance,
      'createdAt': instance.createdAt.toIso8601String(),
    };
