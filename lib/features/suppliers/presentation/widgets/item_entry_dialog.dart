// =============================================================
// File: lib/features/suppliers/presentation/widgets/item_entry_dialog.dart
// Purpose: Dialog for entering quantity, prices, and batch details for a product.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../inventory/domain/models/drug_suggestion_model.dart';
import '../cubit/purchase_invoice_cubit.dart';

class ItemEntryDialog extends StatefulWidget {
  final DrugSuggestionModel suggestion;
  final PurchaseInvoiceCubit cubit;

  const ItemEntryDialog({super.key, required this.suggestion, required this.cubit});

  @override
  State<ItemEntryDialog> createState() => _ItemEntryDialogState();
}

class _ItemEntryDialogState extends State<ItemEntryDialog> {
  final _qtyController = TextEditingController(text: '1');
  final _bonusController = TextEditingController(text: '0');
  final _purchasePriceController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  final _batchController = TextEditingController();
  DateTime _expiryDate = DateTime.now().add(const Duration(days: 365));
  SuggestionUnit? _selectedUnit;

  @override
  void initState() {
    super.initState();
    _purchasePriceController.text = widget.suggestion.costPrice?.toString() ?? '';
    _batchController.text = widget.suggestion.batchNumber ?? '';
    if (widget.suggestion.expiryDate != null) _expiryDate = widget.suggestion.expiryDate!;
    if (widget.suggestion.units != null && widget.suggestion.units!.isNotEmpty) {
      _selectedUnit = widget.suggestion.units!.first;
      _sellingPriceController.text = _selectedUnit!.price?.toString() ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.suggestion.name),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildUnitDropdown(),
            const SizedBox(height: 8),
            _buildQtyAndPrice(),
            const SizedBox(height: 8),
            _buildSellingPrice(),
            const SizedBox(height: 8),
            _buildBatchField(),
            const SizedBox(height: 16),
            _buildExpiryPicker(context),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
        ElevatedButton(onPressed: _onAdd, child: const Text('إضافة للسلة')),
      ],
    );
  }

  Widget _buildUnitDropdown() {
    return DropdownButtonFormField<SuggestionUnit>(
      value: _selectedUnit,
      decoration: const InputDecoration(labelText: 'الوحدة'),
      items: widget.suggestion.units?.map((u) => DropdownMenuItem(value: u, child: Text(u.name))).toList(),
      onChanged: (u) => setState(() {
        _selectedUnit = u;
        if (u?.price != null) _sellingPriceController.text = u!.price!.toString();
      }),
    );
  }

  Widget _buildQtyAndPrice() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: TextFormField(controller: _qtyController, decoration: const InputDecoration(labelText: 'الكمية المشتراة', border: OutlineInputBorder()), keyboardType: TextInputType.number)),
            const SizedBox(width: 8),
            Expanded(child: TextFormField(controller: _bonusController, decoration: const InputDecoration(labelText: 'البونص (مجاني)', border: OutlineInputBorder(), fillColor: Color(0xFFE8F5E9), filled: true), keyboardType: TextInputType.number)),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(controller: _purchasePriceController, decoration: const InputDecoration(labelText: 'سعر التكلفة (للقطعة المشتراة)', border: OutlineInputBorder(), prefixIcon: Icon(Icons.attach_money)), keyboardType: TextInputType.number),
      ],
    );
  }

  Widget _buildSellingPrice() {
    return TextFormField(controller: _sellingPriceController, decoration: const InputDecoration(labelText: 'سعر البيع للجمهور'), keyboardType: TextInputType.number);
  }

  Widget _buildBatchField() {
    return TextFormField(controller: _batchController, decoration: const InputDecoration(labelText: 'رقم التشغيلة (Batch)'));
  }

  Widget _buildExpiryPicker(BuildContext context) {
    return ListTile(
      title: const Text('تاريخ الانتهاء'),
      subtitle: Text(_expiryDate.toString().substring(0, 10)),
      trailing: const Icon(Icons.calendar_today),
      onTap: () async {
        final date = await showDatePicker(context: context, initialDate: _expiryDate, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 3650)));
        if (date != null) setState(() => _expiryDate = date);
      },
    );
  }

  void _onAdd() {
    final double qty = double.tryParse(_qtyController.text) ?? 1;
    final double pPrice = double.tryParse(_purchasePriceController.text) ?? 0;
    final double sPrice = double.tryParse(_sellingPriceController.text) ?? 0;
    final String unitId = _selectedUnit?.id ?? const Uuid().v4();

    widget.cubit.addItem({
      'productId': widget.suggestion.id,
      'productName': widget.suggestion.name,
      'isNew': widget.suggestion.source == DrugSource.master,
      'barcode': widget.suggestion.barcode,
      'quantity': qty,
      'bonusQuantity': double.tryParse(_bonusController.text) ?? 0,
      'purchasePrice': pPrice,
      'sellingPrice': sPrice,
      'unitId': unitId,
      'unitName': _selectedUnit?.name ?? 'علبة',
      'expiryDate': _expiryDate,
      'batchNumber': _batchController.text,
    });
    Navigator.pop(context);
  }
}
