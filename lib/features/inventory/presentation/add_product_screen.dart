// =============================================================
// File: lib/features/inventory/presentation/add_product_screen.dart
// Purpose: Premium UI for adding products with Smart Autocomplete & Auto-fill.
// Layer: Presentation (Inventory)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'bloc/inventory_cubit.dart';
import '../domain/models/drug_suggestion_model.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Section 1: Identity
  final _searchCtrl = TextEditingController();
  final _barcodeCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  String? _selectedCategory;

  // Section 2: Units Engineering
  final _boxContainsCtrl = TextEditingController(text: '1'); 
  final _stripContainsCtrl = TextEditingController(text: '10'); 
  final _boxPriceCtrl = TextEditingController(text: '0.00');
  final _stripPriceCtrl = TextEditingController(text: '0.00');
  final _pillPriceCtrl = TextEditingController(text: '0.00');

  // Section 3: Inventory
  final _qtyBoxCtrl = TextEditingController(text: '0');
  final _qtyStripCtrl = TextEditingController(text: '0');
  final _qtyPillCtrl = TextEditingController(text: '0');
  final _batchCtrl = TextEditingController();
  final _costPriceCtrl = TextEditingController(text: '0.0');
  DateTime? _expiryDate;

  List<String> _categories = [
    'الأدوية الصلبة (أشرطة/أقراص/كبسولات)',
    'الأدوية السائلة (شراب)',
    'قطرات ومستحضرات موضعية',
    'الحقن والأمبولات',
    'التحاميل (لبوس)',
    'المراهم والكريمات',
  ];

  @override
  void initState() {
    super.initState();
    _boxPriceCtrl.addListener(_onBoxPriceChanged);
  }

  void _onBoxPriceChanged() {
    final boxPrice = double.tryParse(_boxPriceCtrl.text) ?? 0;
    final stripsPerBox = double.tryParse(_boxContainsCtrl.text) ?? 1;
    final pillsPerStrip = double.tryParse(_stripContainsCtrl.text) ?? 10;
    
    if (boxPrice > 0) {
      setState(() {
        _stripPriceCtrl.text = (boxPrice / stripsPerBox).toStringAsFixed(2);
        _pillPriceCtrl.text = (boxPrice / (stripsPerBox * pillsPerStrip)).toStringAsFixed(2);
      });
    }
  }

  void _onSuggestionSelected(DrugSuggestionModel suggestion) {
    setState(() {
      _searchCtrl.clear();
      _barcodeCtrl.text = suggestion.barcode ?? '';
      _nameCtrl.text = suggestion.name;
      
      // Auto-fill Category if available, even if it's new
      if (suggestion.category != null && suggestion.category!.trim().isNotEmpty) {
        final cat = suggestion.category!.trim();
        if (!_categories.contains(cat)) {
          _categories = List.from(_categories)..add(cat);
        }
        _selectedCategory = cat;
      }

      // Auto-fill historical batch info if available
      if (suggestion.costPrice != null) {
        _costPriceCtrl.text = suggestion.costPrice!.toStringAsFixed(2);
      }
      if (suggestion.batchNumber != null) {
        _batchCtrl.text = suggestion.batchNumber!;
      }
      if (suggestion.expiryDate != null) {
        _expiryDate = suggestion.expiryDate;
      }

      // Auto-fill Units & Pricing if available (from Local or Master)
      if (suggestion.units != null && suggestion.units!.isNotEmpty) {
        // Find Box (conversion factor 1.0)
        final boxUnit = suggestion.units!.firstWhere(
          (u) => u.conversionFactor == 1.0, 
          orElse: () => suggestion.units!.first
        );
        
        // Find Pill (largest conversion factor)
        final pillUnit = suggestion.units!.reduce((a, b) => 
            (a.conversionFactor > b.conversionFactor) ? a : b);

        _boxPriceCtrl.text = boxUnit.price?.toStringAsFixed(2) ?? '0.00';
        
        // Find Strip (middle unit)
        final stripUnit = suggestion.units!.firstWhere(
          (u) => u.conversionFactor > 1.0 && u.conversionFactor < pillUnit.conversionFactor,
          orElse: () => boxUnit // Default to box if no strip
        );
        
        if (stripUnit != boxUnit) {
          // Case: Box -> Strip -> Pill
          // stripUnit.conversionFactor is how many strips in a box.
          // pillUnit.conversionFactor is how many pills in a box.
          _boxContainsCtrl.text = stripUnit.conversionFactor.toStringAsFixed(0);
          _stripContainsCtrl.text = (pillUnit.conversionFactor / stripUnit.conversionFactor).toStringAsFixed(0);
          _stripPriceCtrl.text = stripUnit.price?.toStringAsFixed(2) ?? '0.00';
        } else {
          // Case: Box -> Pill only
          _boxContainsCtrl.text = '1';
          _stripContainsCtrl.text = pillUnit.conversionFactor.toStringAsFixed(0);
          _stripPriceCtrl.text = (boxUnit.price != null) ? boxUnit.price!.toStringAsFixed(2) : '0.00';
        }
        
        _pillPriceCtrl.text = pillUnit.price?.toStringAsFixed(2) ?? '0.00';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('إضافة رصيد / صنف', 
          style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('بطاقة هوية الصنف', 'بحث ذكي'),
              _buildIdentityCard(),
              const SizedBox(height: 24),
              
              _buildSectionHeader('هندسة الوحدات', 'إعدادات القياس'),
              _buildUnitsCard(),
              const SizedBox(height: 24),
              
              _buildSectionHeader('بيانات المخزون', 'الرصيد الحالي'),
              _buildInventoryCard(),
              const SizedBox(height: 32),
              
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String badge) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32), fontFamily: 'Cairo'
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFC8E6C9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(badge, style: const TextStyle(
              fontSize: 10, color: Color(0xFF2E7D32), fontWeight: FontWeight.bold, fontFamily: 'Cairo'
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildIdentityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('بحث في القاموس أو المخزن'),
          TypeAheadField<DrugSuggestionModel>(
            controller: _searchCtrl,
            builder: (context, controller, focusNode) => _buildSearchField(controller, focusNode),
            suggestionsCallback: (pattern) => context.read<InventoryCubit>().getDrugSuggestions(pattern),
            itemBuilder: (context, suggestion) => _buildSuggestionItem(suggestion),
            onSelected: _onSuggestionSelected,
            loadingBuilder: (context) => const Center(child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator())),
            emptyBuilder: (context) => const Padding(padding: EdgeInsets.all(16), child: Text('لم يتم العثور على نتائج. يمكنك إدخال البيانات يدوياً.', textAlign: TextAlign.center)),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          _buildLabel('اسم الصنف'),
          _buildTextField(_nameCtrl, 'اسم الدواء...', readOnly: false),
          const SizedBox(height: 16),
          _buildLabel('رقم الباركود'),
          _buildTextField(_barcodeCtrl, 'الباركود المستخلص...', readOnly: false),
          const SizedBox(height: 16),
          _buildLabel('التصنيف الرئيسي'),
          _buildDropdownField(),
        ],
      ),
    );
  }

  Widget _buildSearchField(TextEditingController controller, FocusNode focusNode) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: 'ابحث أو امسح الباركود...',
        prefixIcon: const Icon(Icons.qr_code_scanner, color: Colors.green),
        filled: true,
        fillColor: const Color(0xFFF1F3F5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildSuggestionItem(DrugSuggestionModel suggestion) {
    final isLocal = suggestion.source == DrugSource.local;
    return ListTile(
      title: Text(suggestion.name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(suggestion.barcode ?? 'بدون باركود'),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isLocal ? Colors.green.shade50 : Colors.blue.shade50,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          isLocal ? 'موجود في المخزن' : 'من القاموس',
          style: TextStyle(fontSize: 10, color: isLocal ? Colors.green : Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildUnitsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildUnitInput('العلبة تحتوي على', _boxContainsCtrl, 'شريط')),
              const SizedBox(width: 12),
              Expanded(child: _buildUnitInput('الشريط يحتوي على', _stripContainsCtrl, 'حبة')),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildPriceInput('سعر بيع العلبة', _boxPriceCtrl)),
              const SizedBox(width: 12),
              Expanded(child: _buildPriceInput('سعر بيع الشريط', _stripPriceCtrl)),
            ],
          ),
          const SizedBox(height: 16),
          _buildPriceInput('سعر بيع الوحدة الصغرى (الحبة)', _pillPriceCtrl),
        ],
      ),
    );
  }

  Widget _buildInventoryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildStockCounter('علب', _qtyBoxCtrl)),
              const SizedBox(width: 8),
              Expanded(child: _buildStockCounter('شرائط', _qtyStripCtrl)),
              const SizedBox(width: 8),
              Expanded(child: _buildStockCounter('حبوب', _qtyPillCtrl)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildDateInput()),
              const SizedBox(width: 12),
              Expanded(child: _buildBatchInput()),
            ],
          ),
          const SizedBox(height: 16),
          _buildCostInput(),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
  );

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Cairo')),
  );

  Widget _buildTextField(TextEditingController ctrl, String hint, {bool readOnly = false, Widget? prefixIcon}) {
    return TextFormField(
      controller: ctrl,
      readOnly: readOnly,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        filled: true,
        fillColor: const Color(0xFFF1F3F5),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: const Color(0xFFF1F3F5), borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text('اختر التصنيف...', style: TextStyle(color: Colors.grey.shade400, fontSize: 13, fontFamily: 'Cairo')),
          value: _selectedCategory,
          items: _categories.map((s) => DropdownMenuItem(value: s, child: Text(s, style: const TextStyle(fontSize: 13)))).toList(),
          onChanged: (v) => setState(() => _selectedCategory = v),
        ),
      ),
    );
  }

  Widget _buildUnitInput(String label, TextEditingController ctrl, String unit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        _buildTextField(ctrl, '1', prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(unit, style: const TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'Cairo')),
        )),
      ],
    );
  }

  Widget _buildPriceInput(String label, TextEditingController ctrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        TextFormField(
          controller: ctrl,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF455A64)),
          decoration: InputDecoration(
            suffixIcon: const Padding(padding: EdgeInsets.all(12), child: Text('₪', style: TextStyle(fontWeight: FontWeight.bold))),
            filled: true,
            fillColor: const Color(0xFFE8F5E9),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildStockCounter(String label, TextEditingController ctrl) {
    return Column(
      children: [
        _buildLabel(label),
        TextFormField(
          controller: ctrl,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade200)),
          ),
        ),
      ],
    );
  }

  Widget _buildDateInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('تاريخ الصلاحية'),
        InkWell(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now().add(const Duration(days: 365)),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 3650)),
            );
            if (date != null) setState(() => _expiryDate = date);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade200)),
            child: Row(
              children: [
                const Icon(Icons.calendar_month_outlined, size: 20, color: Colors.red),
                const Spacer(),
                Text(_expiryDate == null ? '----------' : _expiryDate!.toString().split(' ')[0], 
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBatchInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('رقم التشغيلة (Batch)'),
        _buildTextField(_batchCtrl, 'Ex: BN-123', prefixIcon: const Icon(Icons.numbers, size: 18, color: Colors.grey)),
      ],
    );
  }

  Widget _buildCostInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('تكلفة الشراء (العلبة)'),
        TextFormField(
          controller: _costPriceCtrl,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF455A64)),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            suffixIcon: const Padding(padding: EdgeInsets.all(12), child: Text('₪', style: TextStyle(fontWeight: FontWeight.bold))),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade200)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.grey.shade200)),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.save_rounded, color: Colors.white),
            label: const Text('حفظ الرصيد', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Cairo', color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00C853),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _expiryDate != null) {
      final boxesInStock = double.tryParse(_qtyBoxCtrl.text) ?? 0;
      final stripsInStock = double.tryParse(_qtyStripCtrl.text) ?? 0;
      final pillsInStock = double.tryParse(_qtyPillCtrl.text) ?? 0;

      final stripsPerBox = double.tryParse(_boxContainsCtrl.text) ?? 1;
      final pillsPerStrip = double.tryParse(_stripContainsCtrl.text) ?? 10;
      final pillsPerBox = stripsPerBox * pillsPerStrip;

      final totalPills = (boxesInStock * pillsPerBox) + 
                         (stripsInStock * pillsPerStrip) + 
                         pillsInStock;

      context.read<InventoryCubit>().createNewProduct(
        name: _nameCtrl.text,
        barcode: _barcodeCtrl.text,
        unitName: 'علبة',
        conversionFactor: pillsPerBox,
        sellingPrice: double.tryParse(_boxPriceCtrl.text) ?? 0,
        initialQty: totalPills,
        costPrice: double.tryParse(_costPriceCtrl.text) ?? 0,
        expiryDate: _expiryDate!,
        stripConversionFactor: stripsPerBox > 1 ? pillsPerStrip : null,
        stripPrice: double.tryParse(_stripPriceCtrl.text),
        pillPrice: double.tryParse(_pillPriceCtrl.text),
      );
      Navigator.pop(context);
    }
  }
}
