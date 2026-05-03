// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_statement_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplierStatementItem _$SupplierStatementItemFromJson(
  Map<String, dynamic> json,
) => _SupplierStatementItem(
  id: (json['id'] as num).toInt(),
  type: $enumDecode(_$StatementItemTypeEnumMap, json['type']),
  amount: (json['amount'] as num).toDouble(),
  date: DateTime.parse(json['date'] as String),
  referenceNumber: json['referenceNumber'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$SupplierStatementItemToJson(
  _SupplierStatementItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$StatementItemTypeEnumMap[instance.type]!,
  'amount': instance.amount,
  'date': instance.date.toIso8601String(),
  'referenceNumber': instance.referenceNumber,
  'notes': instance.notes,
};

const _$StatementItemTypeEnumMap = {
  StatementItemType.invoice: 'invoice',
  StatementItemType.payment: 'payment',
  StatementItemType.openingBalance: 'openingBalance',
};
