// =============================================================
// File: lib/features/suppliers/presentation/widgets/suppliers_empty_state.dart
// Purpose: Display empty state when no suppliers are found.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';

class SuppliersEmptyState extends StatelessWidget {
  const SuppliersEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            'لا يوجد موردين حالياً',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
