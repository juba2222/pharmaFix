// =============================================================
// File: lib/features/suppliers/presentation/widgets/suppliers_app_bar_actions.dart
// Purpose: Sort action for Suppliers AppBar.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_supplier_repository.dart';
import '../cubit/suppliers_cubit.dart';

class SuppliersSortAction extends StatelessWidget {
  const SuppliersSortAction({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SupplierSortOption>(
      icon: const Icon(Icons.sort, color: Colors.white),
      onSelected: (opt) => context.read<SuppliersCubit>().loadSuppliers(sortOption: opt),
      itemBuilder: (context) => [
        const PopupMenuItem(value: SupplierSortOption.highestDebt, child: Text('الأكثر ديناً')),
        const PopupMenuItem(value: SupplierSortOption.oldestDebt, child: Text('الأقدم ديناً')),
      ],
    );
  }
}
