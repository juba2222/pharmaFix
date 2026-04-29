// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CashSession _$CashSessionFromJson(Map<String, dynamic> json) => _CashSession(
  id: json['id'] as String,
  pharmacyId: json['pharmacy_id'] as String,
  userId: json['user_id'] as String,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: json['end_time'] == null
      ? null
      : DateTime.parse(json['end_time'] as String),
  openingBalance: (json['opening_balance'] as num?)?.toDouble(),
  totalSales: (json['total_sales'] as num).toDouble(),
  status: json['status'] as String,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CashSessionToJson(_CashSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pharmacy_id': instance.pharmacyId,
      'user_id': instance.userId,
      'start_time': instance.startTime.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'opening_balance': instance.openingBalance,
      'total_sales': instance.totalSales,
      'status': instance.status,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
