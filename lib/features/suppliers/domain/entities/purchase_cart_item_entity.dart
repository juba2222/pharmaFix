// =============================================================
// File: lib/features/suppliers/domain/entities/purchase_cart_item_entity.dart
// Purpose: Entity representing a single item in a purchase invoice cart.
// Layer: Domain
// =============================================================

import 'package:equatable/equatable.dart';

class PurchaseCartItemEntity extends Equatable {
  final String? productId; // Null if completely new
  final String? masterDrugId; // Filled if pulled from Master
  final String barcode;
  final String name;
  final double purchasePrice; // Cost
  final double sellingPrice; // New selling price
  final int purchasedQuantity; // Paid quantity
  final int bonusQuantity; // Free bonus quantity
  final DateTime expiryDate;
  final String? batchNumber;

  const PurchaseCartItemEntity({
    this.productId,
    this.masterDrugId,
    required this.barcode,
    required this.name,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.purchasedQuantity,
    this.bonusQuantity = 0,
    required this.expiryDate,
    this.batchNumber,
  });

  /// Subtotal calculation logic inside the entity
  double get subTotal => purchasePrice * purchasedQuantity;

  PurchaseCartItemEntity copyWith({
    String? productId,
    String? masterDrugId,
    String? barcode,
    String? name,
    double? purchasePrice,
    double? sellingPrice,
    int? purchasedQuantity,
    int? bonusQuantity,
    DateTime? expiryDate,
    String? batchNumber,
  }) {
    return PurchaseCartItemEntity(
      productId: productId ?? this.productId,
      masterDrugId: masterDrugId ?? this.masterDrugId,
      barcode: barcode ?? this.barcode,
      name: name ?? this.name,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      purchasedQuantity: purchasedQuantity ?? this.purchasedQuantity,
      bonusQuantity: bonusQuantity ?? this.bonusQuantity,
      expiryDate: expiryDate ?? this.expiryDate,
      batchNumber: batchNumber ?? this.batchNumber,
    );
  }

  @override
  List<Object?> get props => [
        productId,
        masterDrugId,
        barcode,
        name,
        purchasePrice,
        sellingPrice,
        purchasedQuantity,
        bonusQuantity,
        expiryDate,
        batchNumber,
      ];
}
