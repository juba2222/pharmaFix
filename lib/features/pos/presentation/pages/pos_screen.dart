// =============================================================
// File: lib/features/pos/presentation/pages/pos_screen.dart
// Purpose: Main POS screen — listens for checkout success/failure and shows SnackBars.
// Layer: Presentation (POS Feature)
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../bloc/pos_cubit.dart';
import '../bloc/pos_state.dart';
import '../widgets/pos_bottom_bar.dart';
import '../widgets/pos_cart_list.dart';
import '../widgets/pos_search_bar.dart';

class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PosCubit>(),
      child: BlocConsumer<PosCubit, PosState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: _handleStatusChange,
        builder: (context, state) => Scaffold(
          backgroundColor: const Color(0xFFF9F9F9),
          appBar: AppBar(
            backgroundColor: const Color(0xFF01C653),
            centerTitle: true,
            title: const Text(
              'PharmaFix — نقطة البيع',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          drawer: const CustomDrawer(),
          body: const Column(
            children: [
              PosSearchBar(),
              Expanded(child: PosCartList()),
              PosBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  void _handleStatusChange(BuildContext context, PosState state) {
    if (state.status == CheckoutStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ تم إصدار الفاتورة بنجاح!'),
          backgroundColor: Color(0xFF01C653),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (state.status == CheckoutStatus.failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage ?? 'حدث خطأ أثناء الدفع'),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
