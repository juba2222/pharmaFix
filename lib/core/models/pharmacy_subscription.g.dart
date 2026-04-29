// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PharmacySubscription _$PharmacySubscriptionFromJson(
  Map<String, dynamic> json,
) => _PharmacySubscription(
  id: json['id'] as String,
  pharmacyId: json['pharmacy_id'] as String,
  status: json['status'] as String,
  endDate: json['end_date'] == null
      ? null
      : DateTime.parse(json['end_date'] as String),
  autoLock: json['auto_lock'] as bool,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$PharmacySubscriptionToJson(
  _PharmacySubscription instance,
) => <String, dynamic>{
  'id': instance.id,
  'pharmacy_id': instance.pharmacyId,
  'status': instance.status,
  'end_date': instance.endDate?.toIso8601String(),
  'auto_lock': instance.autoLock,
  'updated_at': instance.updatedAt?.toIso8601String(),
};
