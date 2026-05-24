import 'package:flutter/material.dart';

class FinanceCard extends StatelessWidget {
  final double balance;
  final double total;
  final double totalPaid;

  const FinanceCard({
    super.key, 
    required this.balance, 
    required this.total, 
    required this.totalPaid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Row: Total Purchases and Total Paid
        Row(
          children: [
            Expanded(
              child: _SmallStatCard(
                label: 'إجمالي المشتريات',
                value: '₪ ${total.toStringAsFixed(2)}',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _SmallStatCard(
                label: 'إجمالي المدفوع',
                value: '₪ ${totalPaid.toStringAsFixed(2)}',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Large Debt Banner
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFBBEAD4), // primary-container from tailwind config
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF006E2A).withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF006E2A).withOpacity(0.05),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'الدين المتبقي المستحق',
                        style: TextStyle(
                          color: Color(0xFF004C1B), // on-primary-container
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '₪ ${balance.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Color(0xFF004C1B),
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Manrope',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF004C1B).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.account_balance_wallet, color: Color(0xFF004C1B), size: 32),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SmallStatCard extends StatelessWidget {
  final String label;
  final String value;

  const _SmallStatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFECEEF1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: const Color(0xFF3C4A3C).withOpacity(0.6),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF191C1E),
              fontFamily: 'Manrope',
            ),
          ),
        ],
      ),
    );
  }
}
