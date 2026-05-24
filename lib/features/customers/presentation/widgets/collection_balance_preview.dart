// =============================================================
// File: lib/features/customers/presentation/widgets/collection_balance_preview.dart
// Purpose: Displays the calculated remaining balance after payment.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';

class CollectionBalancePreview extends StatelessWidget {
  final double currentBalance;
  final double amount;

  const CollectionBalancePreview({
    super.key,
    required this.currentBalance,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final remaining = currentBalance - amount;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFECEEF1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'الرصيد المتبقي بعد الدفع:',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(
            '${remaining.toStringAsFixed(2)} ₪',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: remaining < 0 ? Colors.red : Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
