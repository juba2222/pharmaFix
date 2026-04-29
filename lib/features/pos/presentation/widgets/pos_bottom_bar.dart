// =============================================================
// File: lib/features/pos/presentation/widgets/pos_bottom_bar.dart
// Purpose: Displays total amount and triggers the CheckoutDialog.
// Layer: Presentation (POS)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pos_cubit.dart';
import '../bloc/pos_state.dart';
import 'pos_total_display.dart';
import 'pos_checkout_button.dart';

class PosBottomBar extends StatelessWidget {
  const PosBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PosCheckoutButton(state: state),
              PosTotalDisplay(amount: state.totalAmount),
            ],
          ),
        );
      },
    );
  }
}
