import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pos_cubit.dart';
import '../bloc/pos_state.dart';
import 'checkout_header.dart';
import 'checkout_payment_actions.dart';
import 'checkout_customer_search.dart';
import 'checkout_confirm_layer.dart';

class CheckoutDialog extends StatelessWidget {
  const CheckoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PosCubit, PosState>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('إتمام البيع',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
          content: SizedBox(
            width: 400, // Maximum width
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  CheckoutHeader(),
                  SizedBox(height: 24),
                  CheckoutPaymentActions(),
                  SizedBox(height: 24),
                  CheckoutCustomerSearch(),
                ],
              ),
            ),
          ),
          actions: const [CheckoutConfirmLayer()],
        );
      },
    );
  }
}
