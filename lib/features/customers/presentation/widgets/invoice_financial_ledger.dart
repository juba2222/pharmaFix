// =============================================================
// File: lib/features/customers/presentation/widgets/invoice_financial_ledger.dart
// Purpose: Financial summary section of the invoice.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';

class InvoiceFinancialLedger extends StatelessWidget {
  final double subtotal;
  final double discount;
  final double total;

  const InvoiceFinancialLedger({
    super.key, required this.subtotal, required this.discount, required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF2F4F7), borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                _row('المجموع الفرعي', '${subtotal.toStringAsFixed(2)} ₪', Colors.blueGrey),
                const SizedBox(height: 12),
                _row('الخصم الإجمالي', '- ${discount.toStringAsFixed(2)} ₪', Colors.red),
                const Divider(height: 32),
                _row('الإجمالي النهائي', '${total.toStringAsFixed(2)} ₪', const Color(0xFF006E2A), isBold: true),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            color: const Color(0xFFE6E8EB),
            child: const Row(
              children: [
                Icon(Icons.info_outline, size: 14, color: Colors.blueGrey),
                SizedBox(width: 8),
                Text('تمت المراجعة والتدقيق بواسطة النظام', style: TextStyle(fontSize: 10, color: Colors.blueGrey, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value, Color color, {bool isBold = false}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.w900 : FontWeight.w600, fontSize: isBold ? 18 : 14)),
      Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.w900 : FontWeight.w700, fontSize: isBold ? 22 : 16, color: color, fontFamily: 'Manrope')),
    ],
  );
}
