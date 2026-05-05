import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/customer_entity.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/base/current_session.dart';
import '../bloc/customer_profile_cubit.dart';
import '../bloc/customer_profile_state.dart';
import '../widgets/finance_card.dart';
import '../widgets/sales_history_tab.dart';
import '../widgets/collection_dialog.dart';

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
        appBar: AppBar(
          title: Text(customer.name),
          backgroundColor: const Color(0xFF01C653),
          actions: [
            BlocBuilder<CustomerProfileCubit, CustomerProfileState>(
              builder: (context, state) => TextButton.icon(
                onPressed: () => _showCollectionDialog(context),
                icon: const Icon(Icons.account_balance_wallet, color: Colors.white),
                label: const Text('تحصيل دفعة', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
        body: BlocBuilder<CustomerProfileCubit, CustomerProfileState>(
          builder: (context, state) => state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),
            loaded: (balance, limit, total, last, count, history) => Column(
              children: [
                FinanceCard(balance: balance, total: total, lastSale: last),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(children: [Icon(Icons.history), SizedBox(width: 8), Text('سجل المشتريات', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))]),
                ),
                Expanded(child: SalesHistoryTab(history: history)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCollectionDialog(BuildContext context) {
    showDialog(context: context, builder: (dContext) => CollectionDialog(cubit: context.read<CustomerProfileCubit>()));
  }
}
