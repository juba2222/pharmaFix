import 'package:flutter/material.dart';
import '../pages/sale_invoice_details_screen.dart';

class SalesHistoryTab extends StatelessWidget {
  final List<Map<String, dynamic>> history;
  const SalesHistoryTab({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const Center(child: Text('لا توجد فواتير سابقة', style: TextStyle(color: Colors.grey)));
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFECEEF1)),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: history.length,
        separatorBuilder: (context, index) => const Divider(height: 1, color: Color(0xFFECEEF1)),
        itemBuilder: (context, index) {
          final inv = history[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SaleInvoiceDetailsScreen(invoiceId: inv['id']),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Left: Amount and Status
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₪ ${inv['total']}', 
                        style: const TextStyle(
                          fontWeight: FontWeight.w800, 
                          fontSize: 14, 
                          color: Color(0xFF191C1E),
                          fontFamily: 'Manrope',
                        ),
                      ),
                      const SizedBox(height: 4),
                      _StatusLabel(inv['status']),
                    ],
                  ),
                  const Spacer(),
                  // Middle: Invoice Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'فاتورة #${inv['id'].toString().substring(0, 4)}', 
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 14,
                          color: Color(0xFF191C1E),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        inv['date'].toString().substring(0, 10), 
                        style: TextStyle(fontSize: 11, color: const Color(0xFF3C4A3C).withOpacity(0.6)),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Right: Icon Container
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF006E2A).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.receipt_long, color: Color(0xFF006E2A), size: 20),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _StatusLabel extends StatelessWidget {
  final String status;
  const _StatusLabel(this.status);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey;
    Color bgColor = Colors.grey.withOpacity(0.1);
    String label = status;

    if (status == 'paid') {
      color = const Color(0xFF406B5A); // on-secondary-container
      bgColor = const Color(0xFFBBEAD4); // secondary-container
      label = 'مدفوع';
    } else if (status == 'partial') {
      color = const Color(0xFF76251F); // on-tertiary-container
      bgColor = const Color(0xFFFF8D81); // tertiary-container
      label = 'جزئي';
    } else if (status == 'unpaid') {
      color = const Color(0xFF93000A); // on-error-container
      bgColor = const Color(0xFFFFDAD6); // error-container
      label = 'معلق';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label.toUpperCase(), 
        style: TextStyle(
          color: color, 
          fontSize: 9, 
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
