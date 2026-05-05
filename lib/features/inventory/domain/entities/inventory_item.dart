// =============================================================
// File: lib/features/inventory/domain/entities/inventory_item.dart
// Purpose: Domain entity for a product's aggregated inventory state.
// Layer: Domain (No Flutter imports)
// =============================================================

import 'package:equatable/equatable.dart';

class InventoryItem extends Equatable {
  final String productId;
  final String productName;
  final String? barcode;
  final double totalPills;
  final DateTime? closestExpiry;
  final int conversionFactor;
  final double? sellingPrice;
  final String? batchId;
  final String? unitId;
  final String? baseUnitName;

  const InventoryItem({
    required this.productId,
    required this.productName,
    this.barcode,
    required this.totalPills,
    this.closestExpiry,
    required this.conversionFactor,
    this.sellingPrice,
    this.batchId,
    this.unitId,
    this.baseUnitName,
  });

  /// Arabic formatted quantity: "5 علبة و 10 حبة"
  String get formattedStock {
    if (conversionFactor <= 1) return '${totalPills.toInt()} وحدة';
    final boxes = totalPills ~/ conversionFactor;
    final remaining = totalPills.toInt() % conversionFactor;
    final parts = <String>[];
    if (boxes > 0) parts.add('$boxes علبة');
    if (remaining > 0) parts.add('$remaining حبة');
    return parts.isEmpty ? '0 وحدة' : parts.join(' و ');
  }

  /// Status based on qty & expiry date
  InventoryStatus get status {
    if (closestExpiry != null && closestExpiry!.isBefore(DateTime.now())) {
      return InventoryStatus.expired;
    }
    if (totalPills <= 0) return InventoryStatus.outOfStock;
    if (closestExpiry != null && daysUntilExpiry <= 30) {
      return InventoryStatus.nearExpiry;
    }
    if (totalPills <= 10) return InventoryStatus.lowStock;
    return InventoryStatus.inStock;
  }

  /// Days remaining until expiry (negative = expired)
  int get daysUntilExpiry {
    if (closestExpiry == null) return 9999;
    return closestExpiry!.difference(DateTime.now()).inDays;
  }

  @override
  List<Object?> get props =>
      [productId, productName, barcode, totalPills, closestExpiry, conversionFactor, sellingPrice, batchId, unitId, baseUnitName];
}

enum InventoryStatus { inStock, lowStock, outOfStock, nearExpiry, expired }
