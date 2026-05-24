// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_statement_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupplierStatementItem _$SupplierStatementItemFromJson(
  Map<String, dynamic> json,
) => _SupplierStatementItem(
  id: json['id'] as String,
  type: $enumDecode(_$StatementItemTypeEnumMap, json['type']),
  amount: (json['amount'] as num).toDouble(),
  date: DateTime.parse(json['date'] as String),
  referenceNumber: json['referenceNumber'] as String?,
  notes: json['notes'] as String?,
  paidAmount: (json['paidAmount'] as num?)?.toDouble(),
  remainingAmount: (json['remainingAmount'] as num?)?.toDouble(),
  pharmacyId: json['pharmacyId'] as String?,
  status: json['status'] as String?,
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
  'paidAmount': instance.paidAmount,
  'remainingAmount': instance.remainingAmount,
  'pharmacyId': instance.pharmacyId,
  'status': instance.status,
};

const _$StatementItemTypeEnumMap = {
  StatementItemType.invoice: 'invoice',
  StatementItemType.payment: 'payment',
  StatementItemType.openingBalance: 'openingBalance',
};
