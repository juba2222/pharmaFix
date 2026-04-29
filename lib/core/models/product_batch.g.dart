// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductBatch _$ProductBatchFromJson(Map<String, dynamic> json) =>
    _ProductBatch(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      pharmacyId: json['pharmacy_id'] as String,
      batchNumber: json['batch_number'] as String,
      expiryDate: DateTime.parse(json['expiry_date'] as String),
      quantityBaseUnit: (json['quantity_base_unit'] as num).toDouble(),
      purchasePrice: (json['purchase_price'] as num?)?.toDouble(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ProductBatchToJson(_ProductBatch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'pharmacy_id': instance.pharmacyId,
      'batch_number': instance.batchNumber,
      'expiry_date': instance.expiryDate.toIso8601String(),
      'quantity_base_unit': instance.quantityBaseUnit,
      'purchase_price': instance.purchasePrice,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
