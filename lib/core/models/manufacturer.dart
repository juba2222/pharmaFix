import 'package:freezed_annotation/freezed_annotation.dart';

part 'manufacturer.freezed.dart';
part 'manufacturer.g.dart';

@freezed
abstract class Manufacturer with _$Manufacturer {
  const factory Manufacturer({
    required String id,
    @JsonKey(name: 'pharmacy_id') required String pharmacyId,
    required String name,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Manufacturer;

  factory Manufacturer.fromJson(Map<String, dynamic> json) => _$ManufacturerFromJson(json);
}
