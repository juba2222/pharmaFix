// =============================================================
// File: lib/features/inventory/presentation/widgets/write_off_dialog.dart
// Purpose: Dialog for recording inventory write-offs.
// Layer: Presentation
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/base/current_session.dart';
import '../../domain/entities/inventory_item.dart';
import '../../domain/entities/write_off_entity.dart';
import '../bloc/inventory_cubit.dart';

class WriteOffDialog extends StatefulWidget {
  final InventoryItem item;

  const WriteOffDialog({super.key, required this.item});

  @override
  State<WriteOffDialog> createState() => _WriteOffDialogState();
}

class _WriteOffDialogState extends State<WriteOffDialog> {
  final _qtyController = TextEditingController();
  final _reasonController = TextEditingController();
  String _selectedReason = 'تلف / كسر';
  final List<String> _reasons = ['تلف / كسر', 'انتهاء صلاحية', 'فقدان', 'خطأ جرد', 'أخرى'];

  @override
  void dispose() {
    _qtyController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'تسوية / إتلاف مخزني',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.item.productName,
            style: TextStyle(color: Colors.grey[600], fontFamily: 'Cairo', fontSize: 13),
          ),
          const SizedBox(height: 20),
          
          // Quantity Input
          TextField(
            controller: _qtyController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            decoration: _inputDecoration(
              'الكمية المراد إتلافها (${widget.item.baseUnitName})',
              Icons.remove_circle_outline_rounded,
            ),
          ),
          const SizedBox(height: 16),

          // Reason Selection
          DropdownButtonFormField<String>(
            value: _selectedReason,
            decoration: _inputDecoration('سبب الإتلاف', Icons.help_outline_rounded),
            items: _reasons.map((r) => DropdownMenuItem(
              value: r,
              child: Text(r, style: const TextStyle(fontFamily: 'Cairo')),
            )).toList(),
            onChanged: (v) => setState(() => _selectedReason = v!),
          ),
          const SizedBox(height: 16),

          if (_selectedReason == 'أخرى')
            TextField(
              controller: _reasonController,
              textAlign: TextAlign.right,
              decoration: _inputDecoration('اكتب السبب هنا...', Icons.edit_note_rounded),
            ),
          
          const SizedBox(height: 24),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('إلغاء', style: TextStyle(fontFamily: 'Cairo', color: Colors.grey)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD32F2F),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'تأكيد الإتلاف',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submit() {
    final qty = double.tryParse(_qtyController.text) ?? 0;
    if (qty <= 0) return;

    final reason = _selectedReason == 'أخرى' ? _reasonController.text : _selectedReason;
    final cubit = context.read<InventoryCubit>();
    final session = sl<CurrentSession>();

    // We assume the write-off applies to the oldest batch (FIFO) or the user selects one.
    // For simplicity now, we take the batch info from the InventoryItem (which usually aggregates or shows first batch).
    // In V6.1, InventoryItem has batch information.
    
    final writeOff = WriteOffEntity(
      id: const Uuid().v4(),
      pharmacyId: session.pharmacyId ?? '',
      productId: widget.item.productId,
      batchId: widget.item.batchId ?? '',
      unitId: widget.item.unitId ?? '',
      quantity: qty,
      reason: reason,
      createdAt: DateTime.now(),
    );

    cubit.writeOffStock(writeOff);
    Navigator.pop(context);
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ تم تسجيل عملية الإتلاف بنجاح', style: TextStyle(fontFamily: 'Cairo')),
        backgroundColor: Color(0xFFD32F2F),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13),
      prefixIcon: Icon(icon, color: const Color(0xFFD32F2F)),
      filled: true,
      fillColor: const Color(0xFFF8F9FA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}
