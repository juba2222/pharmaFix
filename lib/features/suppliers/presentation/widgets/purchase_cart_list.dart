// =============================================================
// File: lib/features/suppliers/presentation/widgets/purchase_cart_list.dart
// Purpose: List of items added to the current purchase invoice.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/purchase_invoice_cubit.dart';

class PurchaseCartList extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const PurchaseCartList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const Center(child: Text('السلة فارغة'));
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
            title: Text(item['productName']),
            subtitle: Text('${item['quantity']} ${item['unitName']} × ${item['purchasePrice']} ر.س'),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () => context.read<PurchaseInvoiceCubit>().removeItem(index),
            ),
          ),
        );
      },
    );
  }
}
