// =============================================================
// File: lib/features/customers/presentation/widgets/collection_amount_input.dart
// Purpose: Large input field for payment amount.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';

class CollectionAmountInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const CollectionAmountInput({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'المبلغ المدفوع',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, fontFamily: 'Manrope'),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F9FC),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFECEEF1)),
          ),
          child: Row(
            children: [
              const Text(
                '₪',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF006E2A)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, fontFamily: 'Manrope'),
                  decoration: const InputDecoration(border: InputBorder.none, hintText: '0.00'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
