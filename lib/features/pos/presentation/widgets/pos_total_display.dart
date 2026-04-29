// =============================================================
// File: lib/features/pos/presentation/widgets/pos_total_display.dart
// Purpose: Atomic widget to display the total amount.
// Layer: Presentation (POS)
// =============================================================

import 'package:flutter/material.dart';

class PosTotalDisplay extends StatelessWidget {
  final double amount;
  const PosTotalDisplay({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text('الإجمالي', style: TextStyle(color: Colors.grey, fontSize: 14)),
        Row(
          children: [
            const Text('₪', style: TextStyle(color: Color(0xFF01C653), fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(width: 4),
            Text(
              amount.toStringAsFixed(2),
              style: const TextStyle(color: Color(0xFF01C653), fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ],
    );
  }
}
