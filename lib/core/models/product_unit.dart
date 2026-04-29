import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_unit.freezed.dart';
part 'product_unit.g.dart';

@freezed
abstract class ProductUnit with _$ProductUnit {
  const factory ProductUnit({
    required String id,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'pharmacy_id') required String pharmacyId,
    @JsonKey(name: 'unit_name') required String unitName,
    @JsonKey(name: 'conversion_factor') @Default(1.0) double conversionFactor,
    @JsonKey(name: 'cost_price') @Default(0.0) double costPrice,
    @JsonKey(name: 'selling_price') required double sellingPrice,
    String? barcode,
    @JsonKey(name: 'is_base_unit') @Default(false) bool isBaseUnit,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ProductUnit;

  factory ProductUnit.fromJson(Map<String, dynamic> json) => _$ProductUnitFromJson(json);
}
