// =============================================================
// File: lib/features/suppliers/presentation/widgets/invoices_tab.dart
// Purpose: List of purchase invoices for a specific supplier.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/supplier_statement_item.dart';
import '../../domain/entities/supplier_entity.dart';
import '../cubit/supplier_profile_cubit.dart';
import '../pages/new_purchase_invoice_screen.dart';

class InvoicesTab extends StatelessWidget {
  final List<SupplierStatementItem> invoices;
  // G2: Pass supplier so we can open Draft screen after cancellation
  final SupplierEntity supplier;

  const InvoicesTab({super.key, required this.invoices, required this.supplier});

  @override
  Widget build(BuildContext context) {
    if (invoices.isEmpty) return const Center(child: Text('لا توجد فواتير'));
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: invoices.length,
      itemBuilder: (context, index) {
        final inv = invoices[index];
        return Card(
          child: ListTile(
            title: Text('فاتورة #${inv.referenceNumber ?? '---'}'),
            subtitle: Text(inv.date.toString().substring(0, 10)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${inv.amount.toStringAsFixed(2)} ر.س',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    // G6: Use explicit status field, not notes
                    _StatusBadge(inv.status ?? 'unknown'),
                  ],
                ),
                // G6: Guard using explicit status
                if (inv.status != 'cancelled') ...[
                  if ((inv.remainingAmount ?? 0) > 0)
                    IconButton(
                      icon: const Icon(Icons.payment, color: Colors.green, size: 20),
                      onPressed: () => _showPayInvoiceDialog(context, inv),
                    ),
                  IconButton(
                    icon: const Icon(Icons.cancel_outlined, color: Colors.red, size: 20),
                    onPressed: () => _confirmCancel(context, inv.id),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPayInvoiceDialog(BuildContext context, SupplierStatementItem inv) {
    final remaining = inv.remainingAmount ?? 0;
    final controller = TextEditingController(text: remaining.toStringAsFixed(2));
    showDialog(
      context: context,
      builder: (dContext) => AlertDialog(
        title: Text('تسديد فاتورة #${inv.referenceNumber ?? ''}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // G6: Use explicit remainingAmount
            Text('المبلغ المتبقي: ${remaining.toStringAsFixed(2)} ر.س'),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'المبلغ المدفوع', border: OutlineInputBorder()),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dContext), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(controller.text) ?? 0;
              if (amount > 0) {
                context.read<SupplierProfileCubit>().addPayment(
                      amount,
                      invoiceId: inv.id,
                      pharmacyId: inv.pharmacyId,
                    );
              }
              Navigator.pop(dContext);
            },
            child: const Text('تسديد'),
          ),
        ],
      ),
    );
  }

  void _confirmCancel(BuildContext context, String invoiceId) {
    final cubit = context.read<SupplierProfileCubit>();
    showDialog(
      context: context,
      builder: (dContext) => AlertDialog(
        title: const Text('إلغاء الفاتورة؟'),
        content: const Text(
            'سيتم حذف الأدوية من المخزن وإرجاع الدين للمورد. لا يمكن الإلغاء إذا تم بيع أي علبة.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dContext), child: const Text('رجوع')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(dContext);
              cubit.cancelInvoice(
                invoiceId,
                // G2: Open Draft screen with the cancelled invoice items
                onDraft: (items) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewPurchaseInvoiceScreen(
                      supplier: supplier,
                      initialItems: items,
                    ),
                  ),
                ),
              );
            },
            child: const Text('تأكيد الإلغاء', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge(this.status);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey;
    String label = status;
    if (status == 'paid') { color = Colors.green; label = 'مدفوعة'; }
    else if (status == 'partial') { color = Colors.orange; label = 'متبقي حساب'; }
    else if (status == 'unpaid') { color = Colors.red; label = 'غير مدفوعة'; }
    else if (status == 'cancelled') { color = Colors.black45; label = 'ملغاة'; }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
    );
  }
}
