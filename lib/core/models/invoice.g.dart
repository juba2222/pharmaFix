// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Invoice _$InvoiceFromJson(Map<String, dynamic> json) => _Invoice(
  id: json['id'] as String,
  pharmacyId: json['pharmacy_id'] as String,
  sessionId: json['session_id'] as String,
  userId: json['user_id'] as String,
  customerId: json['customer_id'] as String?,
  totalAmount: (json['total_amount'] as num).toDouble(),
  paidAmount: (json['paid_amount'] as num).toDouble(),
  discountTotal: (json['discount_total'] as num?)?.toDouble() ?? 0.0,
  paymentMethod: json['payment_method'] as String,
  status: json['status'] as String,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$InvoiceToJson(_Invoice instance) => <String, dynamic>{
  'id': instance.id,
  'pharmacy_id': instance.pharmacyId,
  'session_id': instance.sessionId,
  'user_id': instance.userId,
  'customer_id': instance.customerId,
  'total_amount': instance.totalAmount,
  'paid_amount': instance.paidAmount,
  'discount_total': instance.discountTotal,
  'payment_method': instance.paymentMethod,
  'status': instance.status,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
