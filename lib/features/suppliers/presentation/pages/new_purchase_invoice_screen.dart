// =============================================================
// File: lib/features/suppliers/presentation/pages/new_purchase_invoice_screen.dart
// Purpose: Create new purchase invoices.
// Layer: Presentation (UI Page)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/base/current_session.dart';
import '../../domain/entities/supplier_entity.dart';
import '../cubit/purchase_invoice_cubit.dart';
import '../cubit/purchase_invoice_state.dart';
import '../widgets/purchase_invoice_body.dart';

class NewPurchaseInvoiceScreen extends StatefulWidget {
  final SupplierEntity supplier;
  const NewPurchaseInvoiceScreen({super.key, required this.supplier});

  @override
  State<NewPurchaseInvoiceScreen> createState() => _NewPurchaseInvoiceScreenState();
}

class _NewPurchaseInvoiceScreenState extends State<NewPurchaseInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PurchaseInvoiceCubit(
        supplierRepository: sl(),
        pharmacyId: sl<CurrentSession>().pharmacyId ?? '',
      ),
      child: BlocListener<PurchaseInvoiceCubit, PurchaseInvoiceState>(
        listener: _onStateChange,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF01C653),
            title: const Text('فاتورة مشتريات جديدة'),
            actions: [Center(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text(widget.supplier.name, style: const TextStyle(fontSize: 12, color: Colors.white70))))],
          ),
          body: PurchaseInvoiceBody(supplier: widget.supplier),
        ),
      ),
    );
  }

  void _onStateChange(BuildContext context, PurchaseInvoiceState state) {
    if (state.success) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('✅ تم حفظ الفاتورة بنجاح'), backgroundColor: Color(0xFF01C653)));
      Navigator.pop(context);
    }
    if (state.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('❌ خطأ: ${state.error}'), backgroundColor: Colors.red));
    }
  }
}
