import 'package:freezed_annotation/freezed_annotation.dart';

part 'master_drug.freezed.dart';
part 'master_drug.g.dart';

@freezed
abstract class MasterDrug with _$MasterDrug {
  const factory MasterDrug({
    required String id,
    String? barcode,
    @JsonKey(name: 'trade_name') required String tradeName,
    @JsonKey(name: 'scientific_name') String? scientificName,
    String? manufacturer,
    String? form,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'origin_pharmacy_id') String? originPharmacyId,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _MasterDrug;

  factory MasterDrug.fromJson(Map<String, dynamic> json) => _$MasterDrugFromJson(json);
}
