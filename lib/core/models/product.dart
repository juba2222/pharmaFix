import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    @JsonKey(name: 'pharmacy_id') required String pharmacyId,
    @JsonKey(name: 'master_drug_id') String? masterDrugId,
    @JsonKey(name: 'local_name') required String localName,
    String? barcode,
    @JsonKey(name: 'min_stock_threshold') @Default(0.0) double minStockThreshold,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
