import 'package:flutter/material.dart';

class SalesHistoryTab extends StatelessWidget {
  final List<Map<String, dynamic>> history;
  const SalesHistoryTab({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) return const Center(child: Text('لا توجد فواتير سابقة'));
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: history.length,
      itemBuilder: (context, index) {
        final inv = history[index];
        return Card(
          child: ListTile(
            title: Text('فاتورة #${inv['id'].toString().substring(0, 8)}'),
            subtitle: Text(inv['date'].toString().substring(0, 10)),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${inv['total']} ر.س', style: const TextStyle(fontWeight: FontWeight.bold)),
                _StatusLabel(inv['status']),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StatusLabel extends StatelessWidget {
  final String status;
  const _StatusLabel(this.status);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey;
    String label = status;
    if (status == 'paid') { color = Colors.green; label = 'خالصة'; }
    else if (status == 'partial') { color = Colors.orange; label = 'متبقي حساب'; }
    else if (status == 'unpaid') { color = Colors.red; label = 'لم تدفع'; }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
    );
  }
}
