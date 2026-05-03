// =============================================================
// File: lib/features/suppliers/presentation/widgets/supplier_card.dart
// Purpose: Summary card for a supplier.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import '../../domain/entities/supplier_entity.dart';
import '../pages/supplier_profile_screen.dart';
import 'supplier_card_details.dart';

class SupplierCard extends StatelessWidget {
  final SupplierEntity supplier;
  const SupplierCard({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SupplierProfileScreen(supplier: supplier))),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              _Avatar(name: supplier.name),
              const SizedBox(width: 16),
              SupplierCardDetails(supplier: supplier),
              _DebtInfo(debt: supplier.currentBalance),
            ],
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String name;
  const _Avatar({required this.name});
  @override
  Widget build(BuildContext context) => Container(
        width: 50, height: 50,
        decoration: BoxDecoration(color: const Color(0xFF01C653).withOpacity(0.1), shape: BoxShape.circle),
        child: Center(child: Text(name[0], style: const TextStyle(color: Color(0xFF01C653), fontWeight: FontWeight.bold, fontSize: 20))),
      );
}

class _DebtInfo extends StatelessWidget {
  final double debt;
  const _DebtInfo({required this.debt});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text('الدين الحالي', style: TextStyle(color: Colors.grey, fontSize: 10)),
          Text('${debt.toStringAsFixed(2)} ر.س', style: TextStyle(color: debt > 0 ? Colors.red : Colors.green, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      );
}
