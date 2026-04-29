import 'package:freezed_annotation/freezed_annotation.dart';

part 'pharmacy.freezed.dart';
part 'pharmacy.g.dart';

@freezed
abstract class Pharmacy with _$Pharmacy {
  const factory Pharmacy({
    required String id,
    required String name,
    @JsonKey(name: 'license_number') String? licenseNumber,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Pharmacy;

  factory Pharmacy.fromJson(Map<String, dynamic> json) => _$PharmacyFromJson(json);
}
