// =============================================================
// File: lib/features/suppliers/presentation/widgets/invoices_tab.dart
// Purpose: List of purchase invoices for a specific supplier.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import '../../domain/entities/supplier_statement_item.dart';

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
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${inv.amount} ر.س', style: const TextStyle(fontWeight: FontWeight.bold)),
                _StatusBadge(inv.notes ?? ''),
              ],
            ),
          ),
        );
      },
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
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
    );
  }
}
