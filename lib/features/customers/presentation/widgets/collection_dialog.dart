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
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'تحصيل دفعة مالية',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, fontFamily: 'Manrope'),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'سيتم تسوية الفواتير القديمة تلقائياً بنظام FIFO',
              style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF006E2A)),
              decoration: InputDecoration(
                labelText: 'المبلغ المحصل',
                hintText: '0.00',
                prefixText: '₪ ',
                filled: true,
                fillColor: const Color(0xFFF7F9FC),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF006E2A), width: 2)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: 'ملاحظات (اختياري)',
                filled: true,
                fillColor: const Color(0xFFF7F9FC),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('إلغاء', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final amt = double.tryParse(_amountController.text) ?? 0;
                      if (amt > 0) widget.cubit.collectPayment(amt, _notesController.text);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006E2A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: const Text('تأكيد التحصيل', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
