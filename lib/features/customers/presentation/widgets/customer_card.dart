import 'package:flutter/material.dart';
import '../../domain/entities/customer_entity.dart';
import '../pages/customer_profile_screen.dart';

class CustomerCard extends StatelessWidget {
  final CustomerEntity customer;
  const CustomerCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CustomerProfileScreen(customer: customer))),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF01C653).withOpacity(0.1),
          child: const Icon(Icons.person, color: Color(0xFF01C653)),
        ),
        title: Text(customer.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(customer.phone ?? 'بدون رقم هاتف'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${customer.currentBalance.toStringAsFixed(2)} ر.س', style: TextStyle(color: customer.currentBalance > 0 ? Colors.red : Colors.green, fontWeight: FontWeight.bold)),
            const Text('الرصيد', style: TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
