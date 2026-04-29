// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerPayment _$CustomerPaymentFromJson(Map<String, dynamic> json) =>
    _CustomerPayment(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      paymentDate: DateTime.parse(json['payment_date'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CustomerPaymentToJson(_CustomerPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'amount': instance.amount,
      'payment_date': instance.paymentDate.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
