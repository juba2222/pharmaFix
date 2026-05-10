import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../bloc/reports_cubit.dart';
import '../bloc/reports_state.dart';
import '../widgets/report_summary_card.dart';
import 'reports_charts_page.dart';
import 'manage_expenses_screen.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportsCubit(repository: sl())..loadReports(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: const Text('المركز المالي والمحاسبي'),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.calendar_month_rounded),
                onPressed: () => _showDateRangePicker(context),
              ),
            ),
          ],
        ),
        drawer: const CustomDrawer(),
        body: BlocBuilder<ReportsCubit, ReportsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(child: Text(msg)),
              loaded: (pl, cf, inv, debts, start, end, includeExp) =>
                _buildReportContent(context, pl, cf, inv, debts, start, end, includeExp),
            );
          },
        ),
      ),
    );
  }

  Widget _buildReportContent(
    BuildContext context,
    Map<String, dynamic> pl,
    Map<String, dynamic> cf,
    Map<String, dynamic> inv,
    Map<String, dynamic> debts,
    DateTime start,
    DateTime end,
    bool includeExp,
  ) {
    final dateFormat = intl.DateFormat('yyyy/MM/dd');

    return RefreshIndicator(
      onRefresh: () => context.read<ReportsCubit>().loadReports(start: start, end: end),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPeriodIndicator(dateFormat.format(start), dateFormat.format(end)),
          const SizedBox(height: 20),

          _buildSectionHeader('نظرة عامة على الأرباح والخسائر (P&L)', Icons.analytics_rounded),
          ReportSummaryCard(
            title: 'صافي الربح',
            value: '${pl['netProfit'].toStringAsFixed(2)} ر.س',
            subtitle: includeExp ? 'مخصوم منه كافة المصاريف' : 'بدون خصم المصاريف التشغيلية',
            icon: Icons.account_balance_wallet_rounded,
            color: pl['netProfit'] >= 0 ? Colors.green : Colors.red,
            details: [
              _buildDetailRow('إجمالي الإيرادات', '${pl['revenue']} ر.س'),
              _buildDetailRow('تكلفة البضاعة (تقديري)', '- ${pl['cogs']} ر.س'),
              if (includeExp) _buildDetailRow('المصاريف التشغيلية', '- ${pl['expenses']} ر.س'),
            ],
          ),

          const SizedBox(height: 24),
          _buildSectionHeader('حركة التدفق النقدي (Cash Flow)', Icons.swap_horizontal_circle_rounded),
          Row(
            children: [
              Expanded(
                child: ReportSummaryCard(
                  title: 'النقد الداخل',
                  value: '${cf['cashIn']} ر.س',
                  subtitle: 'مبيعات نقدية',
                  icon: Icons.arrow_downward_rounded,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ReportSummaryCard(
                  title: 'النقد الخارج',
                  value: '${cf['cashOut']} ر.س',
                  subtitle: 'مشتريات ومصاريف',
                  icon: Icons.arrow_upward_rounded,
                  color: Colors.orange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          _buildSectionHeader('الديون والالتزامات المالية', Icons.money_off_rounded),
          ReportSummaryCard(
            title: 'الموقف المالي للدين',
            value: '${debts['netPosition'].toStringAsFixed(2)} ر.س',
            subtitle: 'صافي ديون العملاء ناقص ديون الموردين',
            icon: Icons.balance_rounded,
            color: Colors.purple,
            details: [
              _buildDetailRow('ديون العملاء (لك)', '${debts['receivable']} ر.س'),
              _buildDetailRow('ديون الموردين (عليك)', '${debts['payable']} ر.س'),
            ],
          ),

          const SizedBox(height: 24),
          _buildSectionHeader('إحصائيات المخزون', Icons.inventory_2_rounded),
          ReportSummaryCard(
            title: 'قيمة المخزن',
            value: '${inv['stockValue'].toStringAsFixed(0)} ر.س',
            subtitle: 'بناءً على تكلفة الشراء الحالية',
            icon: Icons.warehouse_rounded,
            color: Colors.teal,
            details: [
              _buildDetailRow('أصناف منتهية الصلاحية', '${inv['expiredCount']}'),
              _buildDetailRow('أصناف قريبة الانتهاء', '${inv['nearExpiryCount']}'),
            ],
          ),

          const SizedBox(height: 40),
          _buildActionButtons(context, includeExp),
        ],
      ),
    );
  }

  Widget _buildPeriodIndicator(String start, String end) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF01C653).withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.date_range_rounded, size: 18, color: Color(0xFF01C653)),
          const SizedBox(width: 8),
          Text(
            'الفترة: من $start إلى $end',
            style: const TextStyle(
              color: Color(0xFF01C653),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, right: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade700),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, bool includeExp) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('تضمين المصاريف التشغيلية في صافي الربح'),
          value: includeExp,
          onChanged: (val) => context.read<ReportsCubit>().updateFilter(includeOverheads: val),
          secondary: const Icon(Icons.receipt_long_rounded),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ReportsChartsPage()),
          ),
          icon: const Icon(Icons.bar_chart_rounded),
          label: const Text('انتقل إلى الرسوم البيانية'),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ManageExpensesScreen()),
          ),
          icon: const Icon(Icons.add_card_rounded),
          label: const Text('إضافة مصروف تشغيلي جديد'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF01C653),
            elevation: 0,
            side: const BorderSide(color: Color(0xFF01C653)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ],
    );
  }

  Future<void> _showDateRangePicker(BuildContext context) async {
    final cubit = context.read<ReportsCubit>();

    DateTime start = DateTime.now();
    DateTime end = DateTime.now();

    cubit.state.maybeWhen(
      loaded: (pl, cf, inv, debts, s, e, inc) {
        start = s;
        end = e;
      },
      orElse: () {},
    );

    final results = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: DateTimeRange(
        start: start,
        end: end,
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF01C653),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (results != null) {
      cubit.updateFilter(start: results.start, end: results.end);
    }
  }
}
