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
        backgroundColor: const Color(0xFFF5F7F9),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F7F9),
          elevation: 0,
          centerTitle: true,
          title: const Text('إدارة العملاء', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
          iconTheme: const IconThemeData(color: Colors.black),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Color(0xFF01C653)),
              onPressed: () {},
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        body: BlocBuilder<CustomersCubit, CustomersState>(
          builder: (context, state) => state.when(
            initial: () => const Center(child: CircularProgressIndicator(color: Color(0xFF01C653))),
            loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFF01C653))),
            error: (msg) => Center(child: Text(msg)),
            loaded: (customers, totalDebt) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    // Search and Add Button Row
                    Row(
                      children: [
                        // Search Field
                        Expanded(
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'بحث بالاسم أو الهاتف...',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                                prefixIcon: Icon(Icons.search, color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Add Button
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xFF01C653),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () => _showAddCustomerDialog(context),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Dashboard Cards
                    CustomersDashboard(totalDebt: totalDebt, customersCount: customers.length),
                    
                    const SizedBox(height: 24),
                    
                    // Section Title
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('العملاء النشطون', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                        Text('عرض الكل', style: TextStyle(color: Color(0xFF01C653), fontWeight: FontWeight.bold, fontSize: 14)),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Customers List
                    Expanded(
                      child: ListView.builder(
                        itemCount: customers.length,
                        itemBuilder: (context, index) => CustomerCard(customer: customers[index]),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showAddCustomerDialog(BuildContext context) {
    showDialog(context: context, builder: (dContext) => AddCustomerDialog(cubit: context.read<CustomersCubit>()));
  }
}
