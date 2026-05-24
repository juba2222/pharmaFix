import 'package:flutter/material.dart';

class CustomersDashboard extends StatelessWidget {
  final double totalDebt;
  final int customersCount;
  
  const CustomersDashboard({super.key, required this.totalDebt, required this.customersCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Outstanding Debts Card (Left in LTR, Right in RTL)
        Expanded(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                // Right border accent (Red)
                Positioned(
                  right: 0,
                  top: 15,
                  bottom: 15,
                  child: Container(
                    width: 4,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE53935), // Red
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('الديون المستحقة', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Text(
                        '${totalDebt.truncateToDouble() == totalDebt ? totalDebt.toStringAsFixed(0) : totalDebt.toStringAsFixed(2)} ₪', 
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        textDirection: TextDirection.ltr,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Total Customers Card
        Expanded(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                // Right border accent
                Positioned(
                  right: 0,
                  top: 15,
                  bottom: 15,
                  child: Container(
                    width: 4,
                    decoration: const BoxDecoration(
                      color: Color(0xFF01C653), // Green
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('إجمالي العملاء', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Text(customersCount.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
