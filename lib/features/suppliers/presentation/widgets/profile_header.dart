// =============================================================
// File: lib/features/suppliers/presentation/widgets/profile_header.dart
// Purpose: Display supplier statistics in the profile header.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final double debt;
  final double totalPurchases;
  final int count;

  const ProfileHeader({super.key, required this.debt, required this.totalPurchases, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF01C653),
      child: Row(
        children: [
          _StatCard('إجمالي المشتريات', totalPurchases.toStringAsFixed(2)),
          const SizedBox(width: 12),
          _StatCard('الدين الحالي', debt.toStringAsFixed(2), isRed: debt > 0),
          const SizedBox(width: 12),
          _StatCard('عدد الفواتير', count.toString()),
          const SizedBox(width: 12),
          _PayDebtButton(debt: debt),
        ],
      ),
    );
  }
}

class _PayDebtButton extends StatelessWidget {
  final double debt;
  const _PayDebtButton({required this.debt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showGeneralPaymentDialog(context),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)),
        child: const Column(
          children: [
            Icon(Icons.payment, color: Colors.white, size: 16),
            SizedBox(height: 4),
            Text('تسديد', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _showGeneralPaymentDialog(BuildContext context) {
    final controller = TextEditingController(text: debt > 0 ? debt.toString() : '');
    showDialog(
      context: context,
      builder: (dContext) => AlertDialog(
        title: const Text('تسديد دفعة عامة (شلال)'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('سيتم تسديد الفواتير الأقدم تلقائياً بنظام FIFO.'),
            const SizedBox(height: 16),
            TextField(controller: controller, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'المبلغ المدفوع', border: OutlineInputBorder())),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dContext), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(controller.text) ?? 0;
              if (amount > 0) {
                context.read<SupplierProfileCubit>().addPayment(amount);
              }
              Navigator.pop(dContext);
            },
            child: const Text('تسديد'),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final bool isRed;

  const _StatCard(this.label, this.value, {this.isRed = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: isRed ? Colors.red : Colors.black)),
          ],
        ),
      ),
    );
  }
}
