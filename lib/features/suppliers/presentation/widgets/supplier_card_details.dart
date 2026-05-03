// =============================================================
// File: lib/features/suppliers/presentation/widgets/supplier_card_details.dart
// Purpose: Details section of the supplier card.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import '../../domain/entities/supplier_entity.dart';

class SupplierCardDetails extends StatelessWidget {
  final SupplierEntity supplier;
  const SupplierCardDetails({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(supplier.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          if (supplier.companyName != null) Text(supplier.companyName!, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          if (supplier.phone != null) _buildPhone(supplier.phone!),
        ],
      ),
    );
  }

  Widget _buildPhone(String phone) {
    return Row(
      children: [
        const Icon(Icons.phone, size: 12, color: Colors.grey),
        const SizedBox(width: 4),
        Text(phone, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
