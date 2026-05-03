// =============================================================
// File: lib/features/suppliers/presentation/widgets/suppliers_fab.dart
// Purpose: Floating Action Button for adding a new supplier.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/suppliers_cubit.dart';
import 'add_supplier_bottom_sheet.dart';

class SuppliersFAB extends StatelessWidget {
  const SuppliersFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (c) => AddSupplierBottomSheet(cubit: context.read<SuppliersCubit>()),
      ),
      backgroundColor: const Color(0xFF01C653),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
