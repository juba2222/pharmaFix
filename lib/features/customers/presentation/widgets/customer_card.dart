import 'package:flutter/material.dart';
import '../../domain/entities/customer_entity.dart';
import '../pages/customer_profile_screen.dart';

class CustomerCard extends StatelessWidget {
  final CustomerEntity customer;
  const CustomerCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    Color balanceColor = Colors.black;
    if (customer.currentBalance > 0) {
      balanceColor = const Color(0xFFE53935); // Red (Debt)
    } else if (customer.currentBalance < 0) {
      balanceColor = const Color(0xFF01C653); // Green (Credit)
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CustomerProfileScreen(customer: customer))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              children: [
                // Right: Avatar (Actually on the right in RTL because it's index 0)
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFF2C4C5B),
                  child: Icon(Icons.person, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 16),
                
                // Middle: Name and Phone
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customer.name, 
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        customer.phone?.isNotEmpty == true ? customer.phone! : 'بدون رقم هاتف',
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                
                // Left: Balance
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('الرصيد المتبقي', style: TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          customer.currentBalance.abs().toStringAsFixed(2),
                          style: TextStyle(color: balanceColor, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '₪',
                          style: TextStyle(color: balanceColor, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
