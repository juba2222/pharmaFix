import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_batch.freezed.dart';
part 'product_batch.g.dart';

@freezed
abstract class ProductBatch with _$ProductBatch {
  const factory ProductBatch({
    required String id,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'pharmacy_id') required String pharmacyId,
    @JsonKey(name: 'batch_number') required String batchNumber,
    @JsonKey(name: 'expiry_date') required DateTime expiryDate,
    @JsonKey(name: 'quantity_base_unit') required double quantityBaseUnit,
    @JsonKey(name: 'purchase_price') double? purchasePrice,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ProductBatch;

  factory ProductBatch.fromJson(Map<String, dynamic> json) => _$ProductBatchFromJson(json);
}
