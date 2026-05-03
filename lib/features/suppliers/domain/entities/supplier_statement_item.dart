import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_statement_item.freezed.dart';
part 'supplier_statement_item.g.dart';

enum StatementItemType { invoice, payment, openingBalance }

@freezed
abstract class SupplierStatementItem with _$SupplierStatementItem {
  const factory SupplierStatementItem({
    required String id,

    required StatementItemType type,
    required double amount, // Invoices are added, Payments are subtracted (or vice versa depending on perspective, but usually debt = invoices - payments). Let's keep amount positive and use type to distinguish.
    required DateTime date,
    String? referenceNumber, // Invoice number or payment reference
    String? notes,
  }) = _SupplierStatementItem;

  factory SupplierStatementItem.fromJson(Map<String, dynamic> json) =>
      _$SupplierStatementItemFromJson(json);
}
