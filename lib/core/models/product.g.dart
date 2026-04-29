// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  pharmacyId: json['pharmacy_id'] as String,
  masterDrugId: json['master_drug_id'] as String?,
  localName: json['local_name'] as String,
  barcode: json['barcode'] as String?,
  minStockThreshold: (json['min_stock_threshold'] as num?)?.toDouble() ?? 0.0,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'pharmacy_id': instance.pharmacyId,
  'master_drug_id': instance.masterDrugId,
  'local_name': instance.localName,
  'barcode': instance.barcode,
  'min_stock_threshold': instance.minStockThreshold,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
};
