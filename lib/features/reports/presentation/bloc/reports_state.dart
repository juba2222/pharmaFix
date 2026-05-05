import 'package:freezed_annotation/freezed_annotation.dart';

part 'reports_state.freezed.dart';

@freezed
class ReportsState with _$ReportsState {
  const factory ReportsState.initial() = _Initial;
  const factory ReportsState.loading() = _Loading;
  const factory ReportsState.loaded({
    required Map<String, dynamic> revenue,
    required Map<String, dynamic> expenses,
    required List<Map<String, dynamic>> customers,
    required List<Map<String, dynamic>> suppliers,
    required Map<String, dynamic> inventory,
  }) = _Loaded;
  const factory ReportsState.error(String message) = _Error;
}
