import 'package:flutter/material.dart';

class FinanceCard extends StatelessWidget {
  final double balance;
  final double total;
  final DateTime? lastSale;

  const FinanceCard({super.key, required this.balance, required this.total, this.lastSale});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF01C653),
      child: Row(
        children: [
          _StatItem(label: 'الدين الحالي', value: '${balance.toStringAsFixed(2)} ر.س', isRed: balance > 0),
          _StatItem(label: 'إجمالي المشتريات', value: '${total.toStringAsFixed(2)} ر.س'),
          _StatItem(label: 'آخر موعد سداد', value: lastSale?.toString().substring(0, 10) ?? 'لا يوجد'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isRed;

  const _StatItem({required this.label, required this.value, this.isRed = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey), textAlign: TextAlign.center),
              const SizedBox(height: 4),
              Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isRed ? Colors.red : Colors.black), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
