// =============================================================
// File: lib/features/customers/presentation/widgets/collection_body.dart
// Purpose: Scrollable body for the collection screen.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/customer_entity.dart';
import '../bloc/collection_cubit.dart';
import '../bloc/collection_state.dart';
import 'collection_summary_card.dart';
import 'collection_amount_input.dart';
import 'collection_method_toggle.dart';
import 'collection_balance_preview.dart';

class CollectionBody extends StatelessWidget {
  final CustomerEntity customer;
  final TextEditingController controller;

  const CollectionBody({super.key, required this.customer, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionCubit, CollectionState>(
      builder: (context, state) => state.maybeWhen(
        initial: (balance, amount, method, _) => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CollectionSummaryCard(customer: customer, currentBalance: balance),
              const SizedBox(height: 24),
              CollectionAmountInput(
                controller: controller,
                onChanged: (val) => context.read<CollectionCubit>().amountChanged(double.tryParse(val) ?? 0.0),
              ),
              const SizedBox(height: 24),
              CollectionMethodToggle(
                selectedMethod: method,
                onMethodChanged: (m) => context.read<CollectionCubit>().methodChanged(m),
              ),
              const SizedBox(height: 32),
              CollectionBalancePreview(currentBalance: balance, amount: amount),
            ],
          ),
        ),
        orElse: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
