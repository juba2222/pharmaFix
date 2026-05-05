import 'package:flutter/material.dart';

class CustomersDashboard extends StatelessWidget {
  final double totalDebt;
  const CustomersDashboard({super.key, required this.totalDebt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF01C653),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text('إجمالي الديون المستحقة في السوق', style: TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 8),
              Text('${totalDebt.toStringAsFixed(2)} ر.س', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
