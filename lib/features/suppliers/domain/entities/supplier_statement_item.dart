import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_statement_item.freezed.dart';
part 'supplier_statement_item.g.dart';

enum StatementItemType { invoice, payment, openingBalance }

@freezed
abstract class SupplierStatementItem with _$SupplierStatementItem {
  const factory SupplierStatementItem({
    required String id,
    required StatementItemType type,
    required double amount,
    required DateTime date,
    String? referenceNumber,
    String? notes,
    double? paidAmount,
    String? pharmacyId,
  }) = _SupplierStatementItem;

  factory SupplierStatementItem.fromJson(Map<String, dynamic> json) =>
      _$SupplierStatementItemFromJson(json);
}
