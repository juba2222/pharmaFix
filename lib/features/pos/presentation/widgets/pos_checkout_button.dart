// =============================================================
// File: lib/features/pos/presentation/widgets/pos_checkout_button.dart
// Purpose: Button to trigger checkout.
// Layer: Presentation (POS)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pos_cubit.dart';
import '../bloc/pos_state.dart';
import 'checkout_dialog.dart';

class PosCheckoutButton extends StatelessWidget {
  final PosState state;
  const PosCheckoutButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final isEmpty = state.cartItems.isEmpty;
    final isLoading = state.status == CheckoutStatus.loading;

    return ElevatedButton.icon(
      onPressed: (isEmpty || isLoading)
          ? null
          : () => showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<PosCubit>(),
                  child: const CheckoutDialog(),
                ),
              ),
      icon: isLoading
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            )
          : const Icon(Icons.check_circle_outline),
      label: Text(
        isLoading ? 'جارٍ المعالجة...' : 'إتمام البيع',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isEmpty ? Colors.grey.shade300 : const Color(0xFF01C653),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
