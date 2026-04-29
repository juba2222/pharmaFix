// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pharmacy _$PharmacyFromJson(Map<String, dynamic> json) => _Pharmacy(
  id: json['id'] as String,
  name: json['name'] as String,
  licenseNumber: json['license_number'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$PharmacyToJson(_Pharmacy instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'license_number': instance.licenseNumber,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
