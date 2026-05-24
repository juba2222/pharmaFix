// =============================================================
// File: lib/features/customers/presentation/widgets/invoice_items_list.dart
// Purpose: List of items in the sale invoice.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';
import '../../domain/entities/sale_invoice_entity.dart';

class InvoiceItemsList extends StatelessWidget {
  final List<SaleInvoiceItemEntity> items;

  const InvoiceItemsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              Icon(Icons.medication, color: Color(0xFF006E2A), size: 20),
              SizedBox(width: 8),
              Text('الأصناف المشتراة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, fontFamily: 'Manrope')),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ...items.map((item) => _buildItemCard(item)),
      ],
    );
  }

  Widget _buildItemCard(SaleInvoiceItemEntity item) => Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFECEEF1)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.productName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              Row(
                children: [
                  _badge('النوع: ${item.unitName}'),
                  const SizedBox(width: 8),
                  _badge('الكمية: ${item.quantity}'),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${item.total.toStringAsFixed(2)} ₪', style: const TextStyle(color: Color(0xFF006E2A), fontWeight: FontWeight.w900, fontSize: 16)),
            Text('${item.price.toStringAsFixed(2)} ₪ / ${item.unitName}', style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
      ],
    ),
  );

  Widget _badge(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(color: const Color(0xFFF2F4F7), borderRadius: BorderRadius.circular(4)),
    child: Text(text, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
  );
}
