// =============================================================
// File: lib/features/customers/presentation/widgets/collection_summary_card.dart
// Purpose: Displays customer debt summary in collection screen.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';
import '../../domain/entities/customer_entity.dart';

class CollectionSummaryCard extends StatelessWidget {
  final CustomerEntity customer;
  final double currentBalance;

  const CollectionSummaryCard({
    super.key,
    required this.customer,
    required this.currentBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: _buildDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 24),
          _buildBalanceInfo(),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: const Color(0xFFECEEF1)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.04),
        blurRadius: 20,
        offset: const Offset(0, 4),
      ),
    ],
  );

  Widget _buildHeader() => Row(
    children: [
      const CircleAvatar(
        radius: 24,
        backgroundColor: Color(0xFFF7F9FC),
        child: Icon(Icons.person, color: Color(0xFF006E2A)),
      ),
      const SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customer.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, fontFamily: 'Manrope'),
          ),
          Text(
            'مديونية العميل الحالية',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ],
  );

  Widget _buildBalanceInfo() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFF006E2A).withOpacity(0.05),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'إجمالي الدين:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'Manrope'),
        ),
        Text(
          '${currentBalance.toStringAsFixed(2)} ₪',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF006E2A), fontFamily: 'Manrope'),
        ),
      ],
    ),
  );
}
