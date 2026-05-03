// =============================================================
// File: lib/features/suppliers/presentation/widgets/suppliers_dashboard.dart
// Purpose: Display total debt stat card for suppliers.
// Layer: Presentation (UI Component)
// Dependencies: flutter
// =============================================================

import 'package:flutter/material.dart';

class SuppliersDashboard extends StatelessWidget {
  final double totalDebt;

  const SuppliersDashboard({super.key, required this.totalDebt});

  @override
  Widget build(BuildContext context) {
    final bool hasDebt = totalDebt > 0;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF01C653),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              const Text(
                'إجمالي الديون للموردين',
                style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Text(
                '${totalDebt.toStringAsFixed(2)} ر.س',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: hasDebt ? Colors.red : const Color(0xFF01C653),
                ),
              ),
              if (hasDebt)
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('توجد مبالغ مستحقة الدفع', style: TextStyle(color: Colors.red, fontSize: 12)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
