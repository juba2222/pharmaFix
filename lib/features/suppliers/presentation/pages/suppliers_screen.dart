// =============================================================
// File: lib/features/suppliers/presentation/pages/suppliers_screen.dart
// Purpose: Main screen for managing suppliers list.
// Layer: Presentation (UI Page)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../cubit/suppliers_cubit.dart';
import '../widgets/suppliers_body.dart';
import '../widgets/suppliers_app_bar_actions.dart';
import '../widgets/suppliers_fab.dart';

class SuppliersScreen extends StatelessWidget {
  const SuppliersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SuppliersCubit>()..loadSuppliers(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: AppBar(
          leading: const BackButton(),
          backgroundColor: const Color(0xFF01C653),
          centerTitle: true,
          elevation: 0,
          title: const Text('إدارة الموردين', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          actions: [ const SuppliersSortAction() ],
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: const CustomDrawer(),
        floatingActionButton: const SuppliersFAB(),
        body: const SuppliersBody(),
      ),
    );
  }
}
