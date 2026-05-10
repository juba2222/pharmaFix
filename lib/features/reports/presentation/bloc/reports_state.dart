import 'package:freezed_annotation/freezed_annotation.dart';

part 'reports_state.freezed.dart';

@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState.initial() = _Initial;
  const factory ReportsState.loading() = _Loading;
  const factory ReportsState.loaded({
    required Map<String, dynamic> profitLoss,
    required Map<String, dynamic> cashFlow,
    required Map<String, dynamic> inventory,
    required Map<String, dynamic> debts,
    required DateTime start,
    required DateTime end,
    @Default(true) bool includeOverheads,
  }) = _Loaded;
  const factory ReportsState.error(String message) = _Error;
}
