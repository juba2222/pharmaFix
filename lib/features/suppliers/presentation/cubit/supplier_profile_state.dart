import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/supplier_statement_item.dart';

part 'supplier_profile_state.freezed.dart';

@freezed
class SupplierProfileState with _$SupplierProfileState {
  const factory SupplierProfileState.initial() = _Initial;
  const factory SupplierProfileState.loading() = _Loading;
  const factory SupplierProfileState.loaded({
    required double currentDebt,
    required double totalPurchases,
    required int invoiceCount,
    required List<SupplierStatementItem> invoices,
    required List<Map<String, dynamic>> catalog,
  }) = _Loaded;
  const factory SupplierProfileState.error(String message) = _Error;
}
