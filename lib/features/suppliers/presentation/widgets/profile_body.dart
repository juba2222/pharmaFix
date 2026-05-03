// =============================================================
// File: lib/features/suppliers/presentation/widgets/profile_body.dart
// Purpose: Main content body for the supplier profile screen.
// Layer: Presentation (UI Component)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/supplier_profile_cubit.dart';
import '../cubit/supplier_profile_state.dart';
import 'profile_header.dart';
import 'invoices_tab.dart';
import 'catalog_tab.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplierProfileCubit, SupplierProfileState>(
      builder: (context, state) => state.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (msg) => Center(child: Text(msg)),
        loaded: (debt, total, count, invoices, catalog) => Column(
          children: [
            ProfileHeader(debt: debt, totalPurchases: total, count: count),
            const TabBar(
              labelColor: Color(0xFF01C653),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xFF01C653),
              tabs: [Tab(text: 'الفواتير'), Tab(text: 'أصناف المورد')],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  InvoicesTab(invoices: invoices),
                  CatalogTab(catalog: catalog),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
