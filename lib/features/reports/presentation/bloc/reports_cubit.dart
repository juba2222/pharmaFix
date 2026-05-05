import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_reports_repository.dart';
import 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  final IReportsRepository _repository;

  ReportsCubit({required IReportsRepository repository})
      : _repository = repository,
        super(const ReportsState.initial());

  Future<void> loadAllReports() async {
    emit(const ReportsState.loading());

    final revRes = await _repository.getRevenueReport();
    final expRes = await _repository.getExpenseReport();
    final custRes = await _repository.getCustomersReport();
    final suppRes = await _repository.getSuppliersReport();
    final invRes = await _repository.getInventoryReport();

    // Use a simple combine logic
    if (revRes.isRight() && expRes.isRight() && custRes.isRight() && suppRes.isRight() && invRes.isRight()) {
      emit(ReportsState.loaded(
        revenue: revRes.getOrElse(() => {}),
        expenses: expRes.getOrElse(() => {}),
        customers: custRes.getOrElse(() => []),
        suppliers: suppRes.getOrElse(() => []),
        inventory: invRes.getOrElse(() => {}),
      ));
    } else {
      emit(const ReportsState.error('خطأ في تحميل أحد التقارير'));
    }
  }
}
