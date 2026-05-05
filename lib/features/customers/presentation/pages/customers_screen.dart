import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../../../../core/base/current_session.dart';
import '../bloc/customers_cubit.dart';
import '../bloc/customers_state.dart';
import '../widgets/customers_dashboard.dart';
import '../widgets/customer_card.dart';
import '../widgets/add_customer_dialog.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomersCubit(
        repository: sl(),
        pharmacyId: int.tryParse(sl<CurrentSession>().pharmacyId ?? '0') ?? 0,
      )..loadCustomers(),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('إدارة العملاء'),
          backgroundColor: const Color(0xFF01C653),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        floatingActionButton: BlocBuilder<CustomersCubit, CustomersState>(
          builder: (context, state) => FloatingActionButton(
            backgroundColor: const Color(0xFF01C653),
            onPressed: () => _showAddCustomerDialog(context),
            child: const Icon(Icons.person_add),
          ),
        ),
        body: BlocBuilder<CustomersCubit, CustomersState>(
          builder: (context, state) => state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),
            loaded: (customers, totalDebt) => Column(
              children: [
                CustomersDashboard(totalDebt: totalDebt),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: customers.length,
                    itemBuilder: (context, index) => CustomerCard(customer: customers[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddCustomerDialog(BuildContext context) {
    showDialog(context: context, builder: (dContext) => AddCustomerDialog(cubit: context.read<CustomersCubit>()));
  }
}
