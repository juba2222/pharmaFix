// =============================================================
// File: lib/features/suppliers/presentation/widgets/purchase_summary.dart
// Purpose: Summary of the invoice.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/purchase_invoice_cubit.dart';
import '../cubit/purchase_invoice_state.dart';
import 'purchase_summary_components.dart';

class PurchaseSummary extends StatelessWidget {
  final TextEditingController paidController;
  final String supplierId;
  final String? invoiceNumber;

  const PurchaseSummary({super.key, required this.paidController, required this.supplierId, this.invoiceNumber});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseInvoiceCubit, PurchaseInvoiceState>(
      builder: (context, state) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الإجمالي:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${state.totalAmount.toStringAsFixed(2)} ر.س', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF01C653))),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('إجمالي الكميات:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text('${_calcTotalQty(state.cartItems)} قطعة', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            PaymentFields(controller: paidController, state: state),
            const SizedBox(height: 16),
            PurchaseSaveButton(state: state, supplierId: supplierId, invoiceNumber: invoiceNumber),
          ],
        ),
      ),
    );
  }
  double _calcTotalQty(List<Map<String, dynamic>> items) {
    return items.fold(0.0, (sum, i) => sum + (i['quantity'] as num) + (i['bonusQuantity'] as num? ?? 0.0));
  }
}
