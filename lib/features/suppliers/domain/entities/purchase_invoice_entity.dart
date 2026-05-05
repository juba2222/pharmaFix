// =============================================================
// File: lib/features/suppliers/domain/entities/purchase_invoice_entity.dart
// Purpose: Entity representing a full purchase invoice for the cart.
// Layer: Domain
// =============================================================

import 'package:equatable/equatable.dart';
import 'purchase_cart_item_entity.dart';

class PurchaseInvoiceEntity extends Equatable {
  final List<PurchaseCartItemEntity> items;
  final double globalDiscount;

  const PurchaseInvoiceEntity({
    required this.items,
    this.globalDiscount = 0.0,
  });

  /// Final total calculation logic
  double get finalTotal {
    final subtotal = items.fold(0.0, (sum, item) => sum + item.subTotal);
    return subtotal - globalDiscount;
  }

  PurchaseInvoiceEntity copyWith({
    List<PurchaseCartItemEntity>? items,
    double? globalDiscount,
  }) {
    return PurchaseInvoiceEntity(
      items: items ?? this.items,
      globalDiscount: globalDiscount ?? this.globalDiscount,
    );
  }

  @override
  List<Object?> get props => [items, globalDiscount];
}
