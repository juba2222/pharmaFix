// =============================================================
// File: lib/features/suppliers/presentation/widgets/add_supplier_bottom_sheet.dart
// Purpose: Bottom sheet for adding a new supplier.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import '../cubit/suppliers_cubit.dart';
import 'add_supplier_form.dart';

class AddSupplierBottomSheet extends StatelessWidget {
  final SuppliersCubit cubit;
  const AddSupplierBottomSheet({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16, top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 16),
          const Text('إضافة مورد جديد', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          AddSupplierForm(cubit: cubit),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
