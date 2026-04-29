// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) => _InvoiceItem(
  id: json['id'] as String,
  invoiceId: json['invoice_id'] as String,
  productId: json['product_id'] as String,
  batchId: json['batch_id'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  unitPrice: (json['unit_price'] as num).toDouble(),
  originalUnitPrice: (json['original_unit_price'] as num?)?.toDouble(),
  appliedDiscount: (json['applied_discount'] as num?)?.toDouble() ?? 0.0,
  appliedPremium: (json['applied_premium'] as num?)?.toDouble() ?? 0.0,
  finalUnitPrice: (json['final_unit_price'] as num?)?.toDouble(),
  priceModifiedBy: json['price_modified_by'] as String?,
  subtotal: (json['subtotal'] as num).toDouble(),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$InvoiceItemToJson(_InvoiceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice_id': instance.invoiceId,
      'product_id': instance.productId,
      'batch_id': instance.batchId,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'original_unit_price': instance.originalUnitPrice,
      'applied_discount': instance.appliedDiscount,
      'applied_premium': instance.appliedPremium,
      'final_unit_price': instance.finalUnitPrice,
      'price_modified_by': instance.priceModifiedBy,
      'subtotal': instance.subtotal,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
