// =============================================================
// File: lib/features/pos/domain/entities/sale_item_entity.dart
// Purpose: Represents a single pharmaceutical product unit added to the POS cart.
// Layer: Domain (Pure Dart, no DB dependencies, no UI logic)
// =============================================================

import 'package:equatable/equatable.dart';

class SaleUnitInfo extends Equatable {
  final String id;
  final String name;
  final double conversionFactor;
  final double sellingPrice;

  const SaleUnitInfo({
    required this.id,
    required this.name,
    required this.conversionFactor,
    required this.sellingPrice,
  });

  @override
  List<Object?> get props => [id, name, conversionFactor, sellingPrice];
}

class SaleItemEntity extends Equatable {
  final String productId;
  final String unitId;
  final String productName;
  final String unitName;
  final double conversionFactor;
  final double quantity;
  
  // Pricing
  final double originalUnitPrice;
  final double appliedDiscount;
  final double appliedPremium;
  final double finalUnitPrice;

  // Metadata for UI
  final List<SaleUnitInfo> availableUnits;

  const SaleItemEntity({
    required this.productId,
    required this.unitId,
    required this.productName,
    required this.unitName,
    required this.conversionFactor,
    required this.quantity,
    required this.originalUnitPrice,
    this.appliedDiscount = 0.0,
    this.appliedPremium = 0.0,
    required this.finalUnitPrice,
    this.availableUnits = const [],
  });

  SaleItemEntity copyWith({
    String? productId,
    String? unitId,
    String? productName,
    String? unitName,
    double? conversionFactor,
    double? quantity,
    double? originalUnitPrice,
    double? appliedDiscount,
    double? appliedPremium,
    double? finalUnitPrice,
    List<SaleUnitInfo>? availableUnits,
  }) {
    return SaleItemEntity(
      productId: productId ?? this.productId,
      unitId: unitId ?? this.unitId,
      productName: productName ?? this.productName,
      unitName: unitName ?? this.unitName,
      conversionFactor: conversionFactor ?? this.conversionFactor,
      quantity: quantity ?? this.quantity,
      originalUnitPrice: originalUnitPrice ?? this.originalUnitPrice,
      appliedDiscount: appliedDiscount ?? this.appliedDiscount,
      appliedPremium: appliedPremium ?? this.appliedPremium,
      finalUnitPrice: finalUnitPrice ?? this.finalUnitPrice,
      availableUnits: availableUnits ?? this.availableUnits,
    );
  }

  // Calculate the subtotal for this item line
  double get subtotal => finalUnitPrice * quantity;

  @override
  List<Object?> get props => [
        productId,
        unitId,
        productName,
        unitName,
        conversionFactor,
        quantity,
        originalUnitPrice,
        appliedDiscount,
        appliedPremium,
        finalUnitPrice,
        availableUnits,
      ];
}
