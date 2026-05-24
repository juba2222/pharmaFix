// =============================================================
// File: lib/features/customers/presentation/widgets/invoice_stats_card.dart
// Purpose: Quick stats summary for the invoice.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';

class InvoiceStatsCard extends StatelessWidget {
  final double total;
  final int itemCount;

  const InvoiceStatsCard({super.key, required this.total, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF006E2A), Color(0xFF00C853)],
          begin: Alignment.topLeft, end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: const Color(0xFF006E2A).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Column(
        children: [
          const Text('إجمالي الفاتورة', style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text('${total.toStringAsFixed(2)} ₪', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, fontFamily: 'Manrope')),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(100)),
            child: Text('$itemCount أصناف مختلفة', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
