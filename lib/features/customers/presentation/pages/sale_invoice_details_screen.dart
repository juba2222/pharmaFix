// =============================================================
// File: lib/features/customers/presentation/pages/sale_invoice_details_screen.dart
// Purpose: Main screen for displaying sale invoice details.
// Layer: Presentation (Page)
// Dependencies: sale_invoice_details_cubit.dart, atomic widgets
// =============================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../bloc/sale_invoice_details_cubit.dart';
import '../bloc/sale_invoice_details_state.dart';
import '../widgets/invoice_details_header.dart';
import '../widgets/invoice_stats_card.dart';
import '../widgets/invoice_items_list.dart';
import '../widgets/invoice_financial_ledger.dart';
import '../widgets/invoice_details_app_bar.dart';

class SaleInvoiceDetailsScreen extends StatelessWidget {
  final String invoiceId;
  const SaleInvoiceDetailsScreen({super.key, required this.invoiceId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SaleInvoiceDetailsCubit(repository: sl(), invoiceId: invoiceId)..loadInvoiceDetails(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F9FC),
        appBar: const InvoiceDetailsAppBar(),
        body: BlocBuilder<SaleInvoiceDetailsCubit, SaleInvoiceDetailsState>(
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (msg) => Center(child: Text(msg)),
            loaded: (inv) => SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                InvoiceDetailsHeader(invoice: inv),
                const SizedBox(height: 16),
                InvoiceStatsCard(total: inv.total, itemCount: inv.items.length),
                const SizedBox(height: 24),
                InvoiceItemsList(items: inv.items),
                const SizedBox(height: 32),
                InvoiceFinancialLedger(subtotal: inv.subtotal, discount: inv.discount, total: inv.total),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
