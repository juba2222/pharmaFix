// =============================================================
// File: lib/features/pos/presentation/widgets/pos_cart_list.dart
// Purpose: List of products in the current transaction.
// Layer: Presentation (POS)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pos_cubit.dart';
import '../bloc/pos_state.dart';
import 'pos_cart_item_tile.dart';

class PosCartList extends StatelessWidget {
  const PosCartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        if (state.status == CheckoutStatus.loading) {
          return const Center(child: CircularProgressIndicator(color: Color(0xFF01C653)));
        }

        final items = state.cartItems;
        if (items.isEmpty) return _buildEmptyState();

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: items.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => PosCartItemTile(item: items[index]),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            'لا يوجد عناصر في السلة حالياً',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
