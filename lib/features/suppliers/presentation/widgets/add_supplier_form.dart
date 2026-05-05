// =============================================================
// File: lib/features/suppliers/presentation/widgets/add_supplier_form.dart
// Purpose: Form for entering new supplier details.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import '../cubit/suppliers_cubit.dart';

class AddSupplierForm extends StatefulWidget {
  final SuppliersCubit cubit;
  const AddSupplierForm({super.key, required this.cubit});

  @override
  State<AddSupplierForm> createState() => _AddSupplierFormState();
}

class _AddSupplierFormState extends State<AddSupplierForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _phoneController = TextEditingController();
  final _balanceController = TextEditingController(text: '0.0');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildField(_nameController, 'اسم المورد', Icons.person, (v) => v!.isEmpty ? 'مطلوب' : null),
          const SizedBox(height: 12),
          _buildField(_companyController, 'اسم الشركة (اختياري)', Icons.business),
          const SizedBox(height: 12),
          _buildField(_phoneController, 'رقم الهاتف', Icons.phone, null, TextInputType.phone),
          const SizedBox(height: 12),
          _buildField(_balanceController, 'الرصيد الافتتاحي (مدين)', Icons.account_balance, null, TextInputType.number),
          const SizedBox(height: 24),
          _SubmitButton(formKey: _formKey, name: _nameController, company: _companyController, phone: _phoneController, balance: _balanceController, cubit: widget.cubit),
        ],
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label, IconData icon, [String? Function(String?)? val, TextInputType? type]) {
    return TextFormField(controller: controller, validator: val, keyboardType: type, decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon), border: const OutlineInputBorder()));
  }
}

class _SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController name, company, phone, balance;
  final SuppliersCubit cubit;

  const _SubmitButton({required this.formKey, required this.name, required this.company, required this.phone, required this.balance, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF01C653), foregroundColor: Colors.white),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            cubit.addSupplier(
                          name: name.text,
                          company: company.text.isEmpty ? null : company.text,
                          phone: phone.text.isEmpty ? null : phone.text,
                          openingBalance: double.tryParse(balance.text) ?? 0,
                        );
            Navigator.pop(context);
          }
        },
        child: const Text('حفظ المورد'),
      ),
    );
  }
}
