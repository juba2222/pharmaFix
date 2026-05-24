// =============================================================
// File: lib/features/suppliers/presentation/widgets/purchase_invoice_body.dart
// Purpose: Main content body for the new purchase invoice screen.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/supplier_entity.dart';
import '../cubit/purchase_invoice_cubit.dart';
import '../cubit/purchase_invoice_state.dart';
import 'purchase_cart_list.dart';
import 'purchase_summary.dart';
import 'purchase_product_search.dart';

class PurchaseInvoiceBody extends StatefulWidget {
  final SupplierEntity supplier;
  const PurchaseInvoiceBody({super.key, required this.supplier});

  @override
  State<PurchaseInvoiceBody> createState() => _PurchaseInvoiceBodyState();
}

class _PurchaseInvoiceBodyState extends State<PurchaseInvoiceBody> {
  final _invController = TextEditingController();
  final _paidController = TextEditingController(text: '0.0');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseInvoiceCubit, PurchaseInvoiceState>(
      builder: (context, state) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _invController,
                    decoration: const InputDecoration(
                      labelText: 'رقم الفاتورة (اختياري)',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.receipt),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    icon: const Icon(Icons.calendar_today, size: 18),
                    label: Text(state.invoiceDate?.toString().substring(0, 10) ?? 'التاريخ'),
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: state.invoiceDate ?? DateTime.now(),
                        firstDate: DateTime.now().subtract(const Duration(days: 365)),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );
                      if (date != null) {
                        if (context.mounted) {
                          context.read<PurchaseInvoiceCubit>().updateInvoiceDate(date);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const PurchaseProductSearch(),
          Expanded(child: PurchaseCartList(items: state.cartItems)),
          PurchaseSummary(paidController: _paidController, supplierId: widget.supplier.id, invoiceNumber: _invController.text),
        ],
      ),
    );
  }
}
