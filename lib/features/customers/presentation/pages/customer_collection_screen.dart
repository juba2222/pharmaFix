// =============================================================
// File: lib/features/customers/presentation/pages/customer_collection_screen.dart
// Purpose: Screen for collecting debt payments from customers.
// Layer: Presentation (Page)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/customer_entity.dart';
import '../../../../core/di/injection_container.dart';
import '../bloc/collection_cubit.dart';
import '../bloc/collection_state.dart';
import '../bloc/customer_profile_cubit.dart';
import '../widgets/collection_body.dart';
import '../widgets/confirm_payment_button.dart';

class CustomerCollectionScreen extends StatefulWidget {
  final CustomerEntity customer;
  final double currentBalance;
  final CustomerProfileCubit cubit;

  const CustomerCollectionScreen({
    super.key, required this.customer, 
    required this.currentBalance, required this.cubit,
  });

  @override
  State<CustomerCollectionScreen> createState() => _CustomerCollectionScreenState();
}

class _CustomerCollectionScreenState extends State<CustomerCollectionScreen> {
  final _amountController = TextEditingController();

  @override
  void dispose() { _amountController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CollectionCubit(
        repository: sl(), customerId: widget.customer.id,
        pharmacyId: widget.cubit.pharmacyId, currentBalance: widget.currentBalance,
      ),
      child: BlocConsumer<CollectionCubit, CollectionState>(
        listener: _onStateChanged,
        builder: (context, state) => Scaffold(
          backgroundColor: const Color(0xFFF7F9FC),
          appBar: AppBar(title: const Text('تحصيل دفعة مالية')),
          body: CollectionBody(customer: widget.customer, controller: _amountController),
          bottomNavigationBar: ConfirmPaymentButton(
            isLoading: state.maybeWhen(submitting: () => true, orElse: () => false),
            onPressed: () => context.read<CollectionCubit>().submit(),
          ),
        ),
      ),
    );
  }

  void _onStateChanged(BuildContext context, CollectionState state) {
    state.maybeWhen(
      success: () { widget.cubit.loadProfile(); Navigator.pop(context); },
      failure: (msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg))),
      orElse: () {},
    );
  }
}
