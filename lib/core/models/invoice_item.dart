import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_item.freezed.dart';
part 'invoice_item.g.dart';

@freezed
abstract class InvoiceItem with _$InvoiceItem {
  const factory InvoiceItem({
    required String id,
    @JsonKey(name: 'invoice_id') required String invoiceId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'batch_id') required String batchId,
    required double quantity,
    @JsonKey(name: 'unit_price') required double unitPrice,
    
    // New Pricing Fields
    @JsonKey(name: 'original_unit_price') double? originalUnitPrice,
    @JsonKey(name: 'applied_discount') @Default(0.0) double appliedDiscount,
    @JsonKey(name: 'applied_premium') @Default(0.0) double appliedPremium,
    @JsonKey(name: 'final_unit_price') double? finalUnitPrice,
    @JsonKey(name: 'price_modified_by') String? priceModifiedBy,

    required double subtotal,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _InvoiceItem;

  factory InvoiceItem.fromJson(Map<String, dynamic> json) => _$InvoiceItemFromJson(json);
}
