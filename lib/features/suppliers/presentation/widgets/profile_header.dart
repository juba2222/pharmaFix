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
