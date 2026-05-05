// =============================================================
// File: lib/core/widgets/custom_drawer.dart
// Purpose: Main navigation drawer used globally across features.
// Layer: Core / Presentation
// Dependencies: material.dart, drawer_item.dart
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/inventory/presentation/inventory_screen.dart';
import '../../features/inventory/presentation/bloc/inventory_cubit.dart';
import '../di/injection_container.dart';
import '../../features/suppliers/presentation/pages/suppliers_screen.dart';
import '../../features/customers/presentation/pages/customers_screen.dart';
import 'drawer_item.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 50),
                // User Info
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFFB2EBF2),
                          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // Placeholder
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check_circle, color: Color(0xFF01C653), size: 24),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Apothecary Admin',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text(
                      'Clinical Lead',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'V1.0.4',
                        style: TextStyle(color: Color(0xFF01C653), fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Main Menu
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('MAIN MENU', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                  ),
                ),
                const DrawerItem(icon: Icons.point_of_sale, title: 'نقطة البيع', isSelected: true),
                DrawerItem(
                  icon: Icons.people_outline,
                  title: 'الزبائن',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CustomersScreen()),
                    );
                  },
                ),
                DrawerItem(
                  icon: Icons.local_shipping_outlined,
                  title: 'الموردين',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SuppliersScreen()),
                    );
                  },
                ),

                DrawerItem(
                  icon: Icons.inventory_2_outlined,
                  title: 'المخزن',
                  onTap: () {
                    Navigator.pop(context); // Close drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => sl<InventoryCubit>(),
                          child: const InventoryScreen(),
                        ),
                      ),
                    );
                  },
                ),
                const DrawerItem(icon: Icons.settings_outlined, title: 'الإعدادات'),
                
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('REPORTS', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                      Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade400, size: 16),
                    ],
                  ),
                ),
                const DrawerItem(icon: Icons.attach_money, title: 'تقارير الإيرادات', isSubItem: true),
                const DrawerItem(icon: Icons.receipt_long, title: 'تقارير المصروفات', isSubItem: true),
                const DrawerItem(icon: Icons.person_search, title: 'تقارير الزبائن', isSubItem: true),
                const DrawerItem(icon: Icons.local_shipping, title: 'تقارير الموردين', isSubItem: true),
                const DrawerItem(icon: Icons.inventory, title: 'تقارير المخزن', isSubItem: true),
              ],
            ),
          ),
          // Logout
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
              onPressed: () {
                context.read<AuthBloc>().add(LogoutRequested());
              },
              icon: const Icon(Icons.exit_to_app, color: Colors.white),
              label: const Text('تسجيل الخروج', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF01C653),
                minimumSize: const Size(double.infinity, 50),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
