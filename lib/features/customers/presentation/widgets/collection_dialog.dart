import 'package:flutter/material.dart';
import '../bloc/customer_profile_cubit.dart';

class CollectionDialog extends StatefulWidget {
  final CustomerProfileCubit cubit;
  const CollectionDialog({super.key, required this.cubit});

  @override
  State<CollectionDialog> createState() => _CollectionDialogState();
}

class _CollectionDialogState extends State<CollectionDialog> {
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('تحصيل دفعة من العميل'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('سيتم تسوية الفواتير القديمة تلقائياً (FIFO).', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 16),
          TextField(controller: _amountController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'المبلغ المحصل', border: OutlineInputBorder())),
          const SizedBox(height: 12),
          TextField(controller: _notesController, decoration: const InputDecoration(labelText: 'ملاحظات (اختياري)', border: OutlineInputBorder())),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
        ElevatedButton(
          onPressed: () {
            final amt = double.tryParse(_amountController.text) ?? 0;
            if (amt > 0) widget.cubit.collectPayment(amt, _notesController.text);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF01C653)),
          child: const Text('تأكيد التحصيل', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
