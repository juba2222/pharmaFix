import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_reports_repository.dart';
import 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  final IReportsRepository _repository;

  ReportsCubit({required IReportsRepository repository})
      : _repository = repository,
        super(const ReportsState.initial());

  Future<void> loadReports({
    DateTime? start,
    DateTime? end,
    bool includeOverheads = true,
  }) async {
    final now = DateTime.now();
    final startDate = start ?? DateTime(now.year, now.month, 1);
    final endDate = end ?? now;

    emit(const ReportsState.loading());

    final plRes = await _repository.getProfitLossReport(
      start: startDate,
      end: endDate,
      includeOverheads: includeOverheads,
    );
    final cfRes = await _repository.getCashFlowReport(start: startDate, end: endDate);
    final invRes = await _repository.getInventoryInsights();
    final debtRes = await _repository.getDebtsReport();

    if (plRes.isRight() && cfRes.isRight() && invRes.isRight() && debtRes.isRight()) {
      emit(ReportsState.loaded(
        profitLoss: plRes.getOrElse(() => {}),
        cashFlow: cfRes.getOrElse(() => {}),
        inventory: invRes.getOrElse(() => {}),
        debts: debtRes.getOrElse(() => {}),
        start: startDate,
        end: endDate,
        includeOverheads: includeOverheads,
      ));
    } else {
      emit(const ReportsState.error('فشل تحميل التقارير المالية'));
    }
  }

  void updateFilter({DateTime? start, DateTime? end, bool? includeOverheads}) {
    state.maybeWhen(
      loaded: (pl, cf, inv, debts, s, e, inc) {
        loadReports(
          start: start ?? s,
          end: end ?? e,
          includeOverheads: includeOverheads ?? inc,
        );
      },
      orElse: () {},
    );
  }
}
