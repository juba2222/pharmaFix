// =============================================================
// File: lib/features/pos/presentation/widgets/pos_item_price_field.dart
// Purpose: Atomic price input with embedded increment/decrement arrows.
// =============================================================

import 'package:flutter/material.dart';

class PosItemPriceField extends StatelessWidget {
  final TextEditingController controller;
  final Function(double) onPriceChanged;

  const PosItemPriceField({
    super.key,
    required this.controller,
    required this.onPriceChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 40,
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        onFieldSubmitted: (val) {
          final price = double.tryParse(val);
          if (price != null) onPriceChanged(price);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 8, right: 8),
          border: _border(Colors.grey.shade300),
          focusedBorder: _border(const Color(0xFF01C653), width: 1.5),
          suffixIconConstraints: const BoxConstraints(maxWidth: 32, maxHeight: 40),
          suffixIcon: _buildArrows(),
        ),
      ),
    );
  }

  OutlineInputBorder _border(Color color, {double width = 1.0}) =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: color, width: width));

  Widget _buildArrows() {
    return Container(
      width: 32,
      decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey.shade200))),
      child: Column(
        children: [
          _arrowBtn(Icons.keyboard_arrow_up, 1),
          Container(height: 1, color: Colors.grey.shade200),
          _arrowBtn(Icons.keyboard_arrow_down, -1),
        ],
      ),
    );
  }

  Widget _arrowBtn(IconData icon, double delta) {
    return Expanded(
      child: InkWell(
        onTap: () {
          final current = double.tryParse(controller.text) ?? 0.0;
          onPriceChanged(current + delta);
        },
        child: Center(child: Icon(icon, size: 16, color: Colors.grey)),
      ),
    );
  }
}
