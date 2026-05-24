// =============================================================
// File: lib/features/customers/presentation/widgets/invoice_details_header.dart
// Purpose: Header section of the invoice details screen.
// Layer: Presentation (Component)
// =============================================================

import 'package:flutter/material.dart';
import '../../domain/entities/sale_invoice_entity.dart';
import 'package:intl/intl.dart';

class InvoiceDetailsHeader extends StatelessWidget {
  final SaleInvoiceEntity invoice;

  const InvoiceDetailsHeader({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: _decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopRow(),
          const SizedBox(height: 16),
          _buildInfoRow(),
        ],
      ),
    );
  }

  BoxDecoration _decoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: const Color(0xFFECEEF1)),
    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20)],
  );

  Widget _buildTopRow() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('رقم الفاتورة', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
          Text('#${invoice.id.substring(0, 8)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, fontFamily: 'Manrope')),
        ],
      ),
      _buildStatusBadge(),
    ],
  );

  Widget _buildStatusBadge() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: invoice.status == 'paid' ? const Color(0xFFBBEAD4) : const Color(0xFFFFDAD6),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      invoice.status == 'paid' ? 'مدفوعة بالكامل' : 'غير مدفوعة',
      style: TextStyle(color: invoice.status == 'paid' ? const Color(0xFF006E2A) : const Color(0xFFBA1A1A), fontWeight: FontWeight.bold, fontSize: 12),
    ),
  );

  Widget _buildInfoRow() => Row(
    children: [
      Icon(Icons.calendar_today, size: 14, color: Colors.grey.shade600),
      const SizedBox(width: 6),
      Text(DateFormat('dd MMM yyyy').format(invoice.date), style: const TextStyle(fontSize: 13, color: Colors.grey)),
      const SizedBox(width: 16),
      Icon(Icons.payments, size: 14, color: Colors.grey.shade600),
      const SizedBox(width: 6),
      Text(invoice.paymentMethod, style: const TextStyle(fontSize: 13, color: Colors.grey)),
    ],
  );
}
