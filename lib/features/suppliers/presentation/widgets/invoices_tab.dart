// =============================================================
// File: lib/features/suppliers/presentation/widgets/invoices_tab.dart
// Purpose: List of purchase invoices for a specific supplier.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/supplier_statement_item.dart';
import '../cubit/supplier_profile_cubit.dart';

class InvoicesTab extends StatelessWidget {
  final List<SupplierStatementItem> invoices;

  const InvoicesTab({super.key, required this.invoices});

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
                    Text('${inv.amount} ر.س', style: const TextStyle(fontWeight: FontWeight.bold)),
                    _StatusBadge(inv.notes ?? ''),
                  ],
                ),
                if (inv.notes != 'cancelled')
                  IconButton(
                    icon: const Icon(Icons.cancel_outlined, color: Colors.red, size: 20),
                    onPressed: () => _confirmCancel(context, inv.id),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _confirmCancel(BuildContext context, String invoiceId) {
    showDialog(
      context: context,
      builder: (dContext) => AlertDialog(
        title: const Text('إلغاء الفاتورة؟'),
        content: const Text('سيتم حذف الأدوية من المخزن وإرجاع الدين للمورد. لا يمكن الإلغاء إذا تم بيع أي علبة.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dContext), child: const Text('رجوع')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              context.read<SupplierProfileCubit>().cancelInvoice(invoiceId);
              Navigator.pop(dContext);
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
