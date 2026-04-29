import 'package:freezed_annotation/freezed_annotation.dart';

part 'pharmacy_subscription.freezed.dart';
part 'pharmacy_subscription.g.dart';

@freezed
abstract class PharmacySubscription with _$PharmacySubscription {
  const factory PharmacySubscription({
    required String id,
    @JsonKey(name: 'pharmacy_id') required String pharmacyId,
    required String status,
    @JsonKey(name: 'end_date') DateTime? endDate,
    @JsonKey(name: 'auto_lock') required bool autoLock,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PharmacySubscription;

  factory PharmacySubscription.fromJson(Map<String, dynamic> json) => _$PharmacySubscriptionFromJson(json);
}
