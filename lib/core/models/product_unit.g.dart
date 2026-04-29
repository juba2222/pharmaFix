// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductUnit _$ProductUnitFromJson(Map<String, dynamic> json) => _ProductUnit(
  id: json['id'] as String,
  productId: json['product_id'] as String,
  pharmacyId: json['pharmacy_id'] as String,
  unitName: json['unit_name'] as String,
  conversionFactor: (json['conversion_factor'] as num?)?.toDouble() ?? 1.0,
  costPrice: (json['cost_price'] as num?)?.toDouble() ?? 0.0,
  sellingPrice: (json['selling_price'] as num).toDouble(),
  barcode: json['barcode'] as String?,
  isBaseUnit: json['is_base_unit'] as bool? ?? false,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ProductUnitToJson(_ProductUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'pharmacy_id': instance.pharmacyId,
      'unit_name': instance.unitName,
      'conversion_factor': instance.conversionFactor,
      'cost_price': instance.costPrice,
      'selling_price': instance.sellingPrice,
      'barcode': instance.barcode,
      'is_base_unit': instance.isBaseUnit,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
