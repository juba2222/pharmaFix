import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pos_cubit.dart';
import '../bloc/pos_state.dart';
import '../../../customers/domain/entities/customer_entity.dart';

class CheckoutCustomerSearch extends StatelessWidget {
  const CheckoutCustomerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        if (!state.isDebt) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'العميل (مطلوب لتسجيل الدين)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Autocomplete<CustomerEntity>(
              optionsBuilder: (textEditingValue) {
                if (textEditingValue.text.isEmpty) return const Iterable<CustomerEntity>.empty();
                context.read<PosCubit>().searchCustomers(textEditingValue.text);
                return context.read<PosCubit>().state.customerSearchResults;
              },
              displayStringForOption: (option) => '${option.name} - ${option.phone}',
              onSelected: (selection) => context.read<PosCubit>().selectCustomer(selection),
              fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                if (state.selectedCustomer != null && controller.text.isEmpty) {
                  controller.text = state.selectedCustomer!.name;
                }
                return _buildSearchField(controller, focusNode, context, state);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSearchField(TextEditingController ctrl, FocusNode fn, BuildContext ctx, PosState state) {
    return TextFormField(
      controller: ctrl,
      focusNode: fn,
      decoration: InputDecoration(
        hintText: 'ابحث عن عميل...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state.selectedCustomer != null)
              IconButton(icon: const Icon(Icons.clear, color: Colors.red), onPressed: () {
                ctx.read<PosCubit>().clearSelectedCustomer();
                ctrl.clear();
              }),
            IconButton(
              icon: const Icon(Icons.person_add, color: Color(0xFF01C653)),
              onPressed: () => _showQuickAddCustomerDialog(ctx, ctrl),
            ),
          ],
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }

  void _showQuickAddCustomerDialog(BuildContext context, TextEditingController searchCtrl) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogCtx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('إضافة عميل جديد'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'اسم العميل',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'رقم الجوال',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF01C653)),
              onPressed: () async {
                final name = nameController.text.trim();
                final phone = phoneController.text.trim();
                if (name.isNotEmpty && phone.isNotEmpty) {
                  final newCustomer = await context.read<PosCubit>().quickAddCustomer(name, phone);
                  if (newCustomer != null) {
                    searchCtrl.text = newCustomer.name;
                    if (context.mounted) Navigator.pop(dialogCtx);
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('الرجاء إدخال اسم العميل ورقم الجوال'),
                      backgroundColor: Colors.red,
                    )
                  );
                }
              },
              child: const Text('حفظ', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
