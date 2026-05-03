// =============================================================
// File: lib/features/suppliers/presentation/widgets/suppliers_body.dart
// Purpose: Main content body for the suppliers screen.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/suppliers_cubit.dart';
import '../cubit/suppliers_state.dart';
import 'supplier_card.dart';
import 'suppliers_dashboard.dart';
import 'suppliers_empty_state.dart';

class SuppliersBody extends StatelessWidget {
  const SuppliersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuppliersCubit, SuppliersState>(
      builder: (context, state) => state.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (msg) => Center(child: Text(msg, style: const TextStyle(color: Colors.red))),
        loaded: (suppliers, totalDebt) => Column(
          children: [
            SuppliersDashboard(totalDebt: totalDebt),
            Expanded(
              child: suppliers.isEmpty
                  ? const SuppliersEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: suppliers.length,
                      itemBuilder: (context, index) => SupplierCard(supplier: suppliers[index]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
