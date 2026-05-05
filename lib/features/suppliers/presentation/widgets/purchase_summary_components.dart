// =============================================================
// File: lib/features/suppliers/presentation/widgets/purchase_summary_components.dart
// Purpose: Helper widgets for PurchaseSummary.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/purchase_invoice_cubit.dart';
import '../cubit/purchase_invoice_state.dart';

class PaymentFields extends StatelessWidget {
  final TextEditingController controller;
  final PurchaseInvoiceState state;
  const PaymentFields({super.key, required this.controller, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'المبلغ المدفوع', border: OutlineInputBorder()),
            keyboardType: TextInputType.number,
            onChanged: (val) => context.read<PurchaseInvoiceCubit>().updatePaidAmount(double.tryParse(val) ?? 0),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('المتبقي:', style: TextStyle(fontSize: 10)),
              Text(
                '${(state.totalAmount - state.discountAmount - state.paidAmount).toStringAsFixed(2)} ر.س',
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PurchaseSaveButton extends StatelessWidget {
  final PurchaseInvoiceState state;
  final String supplierId;
  final String? invoiceNumber;

  const PurchaseSaveButton({super.key, required this.state, required this.supplierId, this.invoiceNumber});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: state.isSaving ? null : () => context.read<PurchaseInvoiceCubit>().saveInvoice(supplierId, invoiceNumber),
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF01C653), foregroundColor: Colors.white),
        child: state.isSaving ? const CircularProgressIndicator(color: Colors.white) : const Text('حفظ الفاتورة'),
      ),
    );
  }
}
