import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../bloc/reports_cubit.dart';
import '../bloc/reports_state.dart';
import '../widgets/report_card.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportsCubit(repository: sl())..loadAllReports(),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('مركز التقارير'),
          backgroundColor: const Color(0xFF01C653),
        ),
        drawer: const CustomDrawer(),
        body: BlocBuilder<ReportsCubit, ReportsState>(
          builder: (context, state) => state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),
            loaded: (rev, exp, cust, supp, inv) => ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildSectionTitle('التقارير المالية'),
                ReportCard(title: 'تقرير الإيرادات', value: '${rev['totalSales']} ر.س', icon: Icons.trending_up, color: Colors.green, details: 'إجمالي المحصل: ${rev['totalCollected']}'),
                ReportCard(title: 'تقرير المصروفات', value: '${exp['totalExpenses']} ر.س', icon: Icons.trending_down, color: Colors.red, details: 'خسائر الإتلاف: ${exp['totalLosses']}'),
                const Divider(),
                _buildSectionTitle('تقارير المخزن والشركاء'),
                ReportCard(title: 'تقرير المخازن', value: '${inv['stockValue'].toStringAsFixed(0)} ر.س', icon: Icons.inventory_2, color: Colors.blue, details: 'أصناف منتهية: ${inv['expiredCount']}'),
                ReportCard(title: 'تقرير الزبائن', value: '${cust.length} عميل', icon: Icons.people, color: Colors.orange, details: 'إجمالي الديون: ${cust.fold(0.0, (double sum, c) => sum + c['debt'])}'),
                ReportCard(title: 'تقرير الموردين', value: '${supp.length} مورد', icon: Icons.local_shipping, color: Colors.purple, details: 'ديون الموردين: ${supp.fold(0.0, (double sum, s) => sum + s['debt'])}'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
