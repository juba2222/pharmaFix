// =============================================================
// File: lib/features/suppliers/presentation/widgets/catalog_tab.dart
// Purpose: List of products supplied by the current supplier.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';

class CatalogTab extends StatelessWidget {
  final List catalog;
  const CatalogTab({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    if (catalog.isEmpty) return const Center(child: Text('لم يتم شراء أي أصناف من هذا المورد'));
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: catalog.length,
      itemBuilder: (context, index) {
        final p = catalog[index];
        return ListTile(
          leading: const Icon(Icons.medication),
          title: Text(p['name']),
          subtitle: Text(p['barcode'] ?? ''),
        );
      },
    );
  }
}
