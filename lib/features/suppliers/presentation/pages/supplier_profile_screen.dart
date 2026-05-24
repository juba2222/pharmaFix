// =============================================================
// File: lib/features/suppliers/presentation/pages/supplier_profile_screen.dart
// Purpose: Detailed view for a supplier.
// Layer: Presentation (UI Page)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/base/current_session.dart';
import '../../domain/entities/supplier_entity.dart';
import '../cubit/supplier_profile_cubit.dart';
import '../widgets/profile_body.dart';
import 'new_purchase_invoice_screen.dart';

class SupplierProfileScreen extends StatelessWidget {
  final SupplierEntity supplier;
  const SupplierProfileScreen({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // G3: Pass CurrentSession so cubit resolves pharmacyId correctly
      create: (_) => SupplierProfileCubit(
        repository: sl(),
        supplierId: supplier.id,
        session: sl<CurrentSession>(),
      )..loadProfile(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0xFFF9F9F9),
          appBar: AppBar(
          leading: const BackButton(),
            backgroundColor: const Color(0xFF01C653),
            title: Text(supplier.name),
            actions: [
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NewPurchaseInvoiceScreen(supplier: supplier))),
              ),
            ],
          ),
          body: ProfileBody(supplier: supplier),
        ),
      ),
    );
  }
}
