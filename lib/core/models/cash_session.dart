import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_session.freezed.dart';
part 'cash_session.g.dart';

@freezed
abstract class CashSession with _$CashSession {
  const factory CashSession({
    required String id,
    @JsonKey(name: 'pharmacy_id') required String pharmacyId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') DateTime? endTime,
    @JsonKey(name: 'opening_balance') double? openingBalance,
    @JsonKey(name: 'total_sales') required double totalSales,
    required String status,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CashSession;

  factory CashSession.fromJson(Map<String, dynamic> json) => _$CashSessionFromJson(json);
}
