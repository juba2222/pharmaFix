// =============================================================
// File: lib/features/pos/presentation/widgets/pos_item_quantity_selector.dart
// Purpose: Atomic widget for managing item quantity in POS cart.
// =============================================================

import 'package:flutter/material.dart';

class PosItemQuantitySelector extends StatelessWidget {
  final double quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const PosItemQuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildBtn(Icons.add, onIncrement, isRight: true),
          Container(width: 1, color: Colors.grey.shade300),
          SizedBox(
            width: 40,
            child: Text(
              quantity.toStringAsFixed(0),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          Container(width: 1, color: Colors.grey.shade300),
          _buildBtn(Icons.remove, onDecrement, isLeft: true),
        ],
      ),
    );
  }

  Widget _buildBtn(IconData icon, VoidCallback tap, {bool isRight = false, bool isLeft = false}) {
    return InkWell(
      onTap: tap,
      borderRadius: BorderRadius.horizontal(
        right: isRight ? const Radius.circular(8) : Radius.zero,
        left: isLeft ? const Radius.circular(8) : Radius.zero,
      ),
      child: Container(
        width: 32,
        alignment: Alignment.center,
        child: Icon(icon, size: 16, color: const Color(0xFF18181B)),
      ),
    );
  }
}
