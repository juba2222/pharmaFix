// =============================================================
// File: lib/features/customers/presentation/widgets/collection_method_toggle.dart
// Purpose: Toggle buttons for selecting payment method.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';

class CollectionMethodToggle extends StatelessWidget {
  final String selectedMethod;
  final Function(String) onMethodChanged;

  const CollectionMethodToggle({
    super.key,
    required this.selectedMethod,
    required this.onMethodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'طريقة الدفع',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, fontFamily: 'Manrope'),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildButton('cash', 'نقدي', Icons.payments)),
            const SizedBox(width: 12),
            Expanded(child: _buildButton('bank', 'بنكي', Icons.account_balance)),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String method, String label, IconData icon) {
    final isSelected = selectedMethod == method;
    return InkWell(
      onTap: () => onMethodChanged(method),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF006E2A) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFF006E2A) : const Color(0xFFECEEF1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
