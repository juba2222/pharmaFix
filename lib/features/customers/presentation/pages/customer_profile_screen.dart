// =============================================================
// File: lib/features/customers/presentation/pages/customer_profile_screen.dart
// Purpose: Main profile screen for a single customer.
// Layer: Presentation (Page)
// Dependencies: customer_profile_cubit.dart, customer_collection_screen.dart
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/customer_entity.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/base/current_session.dart';
import '../bloc/customer_profile_cubit.dart';
import '../bloc/customer_profile_state.dart';
import '../widgets/finance_card.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_avatar_section.dart';
import '../widgets/profile_invoice_list_section.dart';
import './customer_collection_screen.dart';

class CustomerProfileScreen extends StatelessWidget {
  final CustomerEntity customer;
  const CustomerProfileScreen({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerProfileCubit(
        repository: sl(),
        customerId: customer.id,
        pharmacyId: int.tryParse(sl<CurrentSession>().pharmacyId ?? '0') ?? 0,
      )..loadProfile(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F9FC),
        extendBodyBehindAppBar: true,
        appBar: const ProfileAppBar(),
        body: const _ProfileBody(),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    final customer = (context.findAncestorWidgetOfExactType<CustomerProfileScreen>())!.customer;
    return BlocBuilder<CustomerProfileCubit, CustomerProfileState>(
      builder: (context, state) => state.when(
        initial: () => _loading(),
        loading: () => _loading(),
        error: (msg) => Center(child: Text(msg)),
        loaded: (balance, limit, total, last, count, history) => _buildContent(context, customer, balance, total, history),
      ),
    );
  }

  Widget _loading() => const Center(child: CircularProgressIndicator(color: Color(0xFF006E2A)));

  Widget _buildContent(BuildContext context, CustomerEntity customer, double balance, double total, List<Map<String, dynamic>> history) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 100, 20, 40),
      child: Column(
        children: [
          ProfileAvatarSection(customer: customer),
          const SizedBox(height: 24),
          FinanceCard(balance: balance, total: total, totalPaid: total - balance),
          const SizedBox(height: 24),
          _CollectionButton(balance: balance, customer: customer),
          const SizedBox(height: 32),
          ProfileInvoiceListSection(history: history),
        ],
      ),
    );
  }
}

class _CollectionButton extends StatelessWidget {
  final double balance;
  final CustomerEntity customer;
  const _CollectionButton({required this.balance, required this.customer});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _navigate(context),
      style: _style(),
      icon: const Icon(Icons.payments, size: 20),
      label: const Text('تحصيل دفعة مالية', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, fontFamily: 'Manrope')),
    );
  }

  ButtonStyle _style() => ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF006E2A),
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 60),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 4, shadowColor: const Color(0xFF006E2A).withOpacity(0.4),
  );

  void _navigate(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (dContext) => CustomerCollectionScreen(
        customer: customer, currentBalance: balance,
        cubit: context.read<CustomerProfileCubit>(),
      ),
    ));
  }
}
