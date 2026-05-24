// =============================================================
// File: lib/features/customers/presentation/widgets/confirm_payment_button.dart
// Purpose: Sticky bottom button for confirming payment collection.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';

class ConfirmPaymentButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const ConfirmPaymentButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: _style(),
        child: isLoading ? _loading() : _label(),
      ),
    );
  }

  ButtonStyle _style() => ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF006E2A),
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 56),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 8,
    shadowColor: const Color(0xFF006E2A).withOpacity(0.4),
  );

  Widget _loading() => const SizedBox(
    height: 24, width: 24,
    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
  );

  Widget _label() => const Text(
    'تأكيد استلام الدفعة',
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, fontFamily: 'Manrope'),
  );
}
