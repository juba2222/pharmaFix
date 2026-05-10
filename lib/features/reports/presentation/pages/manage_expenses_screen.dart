import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import '../../../../core/database/app_database.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/database/uuid_instance.dart';

class ManageExpensesScreen extends StatefulWidget {
  const ManageExpensesScreen({super.key});

  @override
  State<ManageExpensesScreen> createState() => _ManageExpensesScreenState();
}

class _ManageExpensesScreenState extends State<ManageExpensesScreen> {
  final _amountController = TextEditingController();
  final _descController = TextEditingController();
  String _selectedCategory = 'إيجار';
  final List<String> _categories = ['إيجار', 'رواتب', 'كهرباء/ماء', 'مشتريات عامة', 'أخرى'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة المصاريف التشغيلية')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _selectedCategory = v!),
              decoration: const InputDecoration(labelText: 'الفئة'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'المبلغ (ر.س)', prefixIcon: Icon(Icons.money)),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'الوصف (اختياري)'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                backgroundColor: const Color(0xFF01C653),
                foregroundColor: Colors.white,
              ),
              onPressed: _saveExpense,
              child: const Text('حفظ المصروف', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveExpense() async {
    final amount = double.tryParse(_amountController.text) ?? 0;
    if (amount <= 0) return;

    final db = sl<AppDatabase>();
    await db.into(db.expensesTable).insert(
      ExpensesTableCompanion.insert(
        id: uuid.v4(),
        pharmacyId: 'demo-pharmacy',
        category: _selectedCategory,
        amount: amount,
        description: Value(_descController.text),
        date: DateTime.now(),
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم حفظ المصروف بنجاح')));
      Navigator.pop(context);
    }
  }
}
