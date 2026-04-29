// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_drug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MasterDrug _$MasterDrugFromJson(Map<String, dynamic> json) => _MasterDrug(
  id: json['id'] as String,
  barcode: json['barcode'] as String?,
  tradeName: json['trade_name'] as String,
  scientificName: json['scientific_name'] as String?,
  manufacturer: json['manufacturer'] as String?,
  form: json['form'] as String?,
  isVerified: json['is_verified'] as bool? ?? false,
  originPharmacyId: json['origin_pharmacy_id'] as String?,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$MasterDrugToJson(_MasterDrug instance) =>
    <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'trade_name': instance.tradeName,
      'scientific_name': instance.scientificName,
      'manufacturer': instance.manufacturer,
      'form': instance.form,
      'is_verified': instance.isVerified,
      'origin_pharmacy_id': instance.originPharmacyId,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
