// =============================================================
// File: lib/features/customers/presentation/widgets/invoice_details_app_bar.dart
// Purpose: Custom AppBar for invoice details screen.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';

class InvoiceDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InvoiceDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, elevation: 0,
      leading: IconButton(icon: const Icon(Icons.arrow_back, color: Color(0xFF006E2A)), onPressed: () => Navigator.pop(context)),
      title: const Text('تفاصيل الفاتورة', style: TextStyle(color: Color(0xFF006E2A), fontWeight: FontWeight.w900)),
      actions: [
        IconButton(icon: const Icon(Icons.print, color: Color(0xFF006E2A)), onPressed: () {}),
        IconButton(icon: const Icon(Icons.share, color: Color(0xFF006E2A)), onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
