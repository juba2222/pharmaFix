import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_payment.freezed.dart';
part 'customer_payment.g.dart';

@freezed
abstract class CustomerPayment with _$CustomerPayment {
  const factory CustomerPayment({
    required String id,
    @JsonKey(name: 'customer_id') required String customerId,
    required double amount,
    @JsonKey(name: 'payment_date') required DateTime paymentDate,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CustomerPayment;

  factory CustomerPayment.fromJson(Map<String, dynamic> json) => _$CustomerPaymentFromJson(json);
}
