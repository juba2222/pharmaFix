// =============================================================
// File: lib/features/customers/domain/entities/sale_invoice_entity.dart
// Purpose: Pure Domain Entity representing a Sales Invoice with items.
// Layer: Domain (Entity)
// =============================================================

import 'package:equatable/equatable.dart';

class SaleInvoiceEntity extends Equatable {
  final String id;
  final String status;
  final DateTime date;
  final double subtotal;
  final double discount;
  final double total;
  final double paidAmount;
  final String paymentMethod;
  final List<SaleInvoiceItemEntity> items;

  const SaleInvoiceEntity({
    required this.id,
    required this.status,
    required this.date,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.paidAmount,
    required this.paymentMethod,
    required this.items,
  });

  @override
  List<Object?> get props => [id, status, date, total, items];
}

class SaleInvoiceItemEntity extends Equatable {
  final String productName;
  final String unitName;
  final double quantity;
  final double price;
  final double total;

  const SaleInvoiceItemEntity({
    required this.productName,
    required this.unitName,
    required this.quantity,
    required this.price,
    required this.total,
  });

  @override
  List<Object?> get props => [productName, quantity, price, total];
}
