// =============================================================
// File: lib/features/inventory/domain/entities/medicine.dart
// Purpose: Pure Domain Entity representing a Medicine in Inventory.
// Layer: Domain (Inventory)
// =============================================================


import '../../../../core/base/base_entity.dart';

class Medicine extends BaseEntity {
  final String name;
  final String barcode;
  final double price;
  final int stockQuantity;
  final DateTime? expiryDate;

  const Medicine({
    required super.id,
    required super.createdAt,
    required this.name,
    required this.barcode,
    required this.price,
    required this.stockQuantity,
    this.expiryDate,
  });

  @override
  List<Object?> get props => [id, name, barcode, price, stockQuantity, expiryDate];
}
