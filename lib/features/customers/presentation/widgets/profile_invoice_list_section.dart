// =============================================================
// File: lib/features/customers/presentation/widgets/profile_invoice_list_section.dart
// Purpose: Section header and list for customer invoice history.
// Layer: Presentation (Component)
// Dependencies: sales_history_tab.dart
// =============================================================

import 'package:flutter/material.dart';
import 'sales_history_tab.dart';

class ProfileInvoiceListSection extends StatelessWidget {
  final List<Map<String, dynamic>> history;

  const ProfileInvoiceListSection({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        const SizedBox(height: 12),
        SalesHistoryTab(history: history),
      ],
    );
  }

  Widget _buildHeader() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Text(
        'آخر الفواتير', 
        style: TextStyle(
          color: Color(0xFF191C1E), 
          fontWeight: FontWeight.w900, 
          fontSize: 18,
          fontFamily: 'Manrope',
        ),
      ),
      TextButton(
        onPressed: () {},
        child: const Text(
          'عرض السجل الكامل', 
          style: TextStyle(
            color: Color(0xFF006E2A), 
            fontWeight: FontWeight.bold, 
            fontSize: 13,
          ),
        ),
      ),
    ],
  );
}
