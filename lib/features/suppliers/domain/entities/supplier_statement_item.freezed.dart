// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_statement_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplierStatementItem {

 String get id; StatementItemType get type; double get amount; DateTime get date; String? get referenceNumber; String? get notes; double? get paidAmount; String? get pharmacyId;
/// Create a copy of SupplierStatementItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierStatementItemCopyWith<SupplierStatementItem> get copyWith => _$SupplierStatementItemCopyWithImpl<SupplierStatementItem>(this as SupplierStatementItem, _$identity);

  /// Serializes this SupplierStatementItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierStatementItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,date,referenceNumber,notes,paidAmount,pharmacyId);

@override
String toString() {
  return 'SupplierStatementItem(id: $id, type: $type, amount: $amount, date: $date, referenceNumber: $referenceNumber, notes: $notes, paidAmount: $paidAmount, pharmacyId: $pharmacyId)';
}


}

/// @nodoc
abstract mixin class $SupplierStatementItemCopyWith<$Res>  {
  factory $SupplierStatementItemCopyWith(SupplierStatementItem value, $Res Function(SupplierStatementItem) _then) = _$SupplierStatementItemCopyWithImpl;
@useResult
$Res call({
 String id, StatementItemType type, double amount, DateTime date, String? referenceNumber, String? notes, double? paidAmount, String? pharmacyId
});




}
/// @nodoc
class _$SupplierStatementItemCopyWithImpl<$Res>
    implements $SupplierStatementItemCopyWith<$Res> {
  _$SupplierStatementItemCopyWithImpl(this._self, this._then);

  final SupplierStatementItem _self;
  final $Res Function(SupplierStatementItem) _then;

/// Create a copy of SupplierStatementItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? amount = null,Object? date = null,Object? referenceNumber = freezed,Object? notes = freezed,Object? paidAmount = freezed,Object? pharmacyId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StatementItemType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,paidAmount: freezed == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double?,pharmacyId: freezed == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierStatementItem].
extension SupplierStatementItemPatterns on SupplierStatementItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierStatementItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierStatementItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierStatementItem value)  $default,){
final _that = this;
switch (_that) {
case _SupplierStatementItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierStatementItem value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierStatementItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  StatementItemType type,  double amount,  DateTime date,  String? referenceNumber,  String? notes,  double? paidAmount,  String? pharmacyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierStatementItem() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.date,_that.referenceNumber,_that.notes,_that.paidAmount,_that.pharmacyId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  StatementItemType type,  double amount,  DateTime date,  String? referenceNumber,  String? notes,  double? paidAmount,  String? pharmacyId)  $default,) {final _that = this;
switch (_that) {
case _SupplierStatementItem():
return $default(_that.id,_that.type,_that.amount,_that.date,_that.referenceNumber,_that.notes,_that.paidAmount,_that.pharmacyId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  StatementItemType type,  double amount,  DateTime date,  String? referenceNumber,  String? notes,  double? paidAmount,  String? pharmacyId)?  $default,) {final _that = this;
switch (_that) {
case _SupplierStatementItem() when $default != null:
return $default(_that.id,_that.type,_that.amount,_that.date,_that.referenceNumber,_that.notes,_that.paidAmount,_that.pharmacyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplierStatementItem implements SupplierStatementItem {
  const _SupplierStatementItem({required this.id, required this.type, required this.amount, required this.date, this.referenceNumber, this.notes, this.paidAmount, this.pharmacyId});
  factory _SupplierStatementItem.fromJson(Map<String, dynamic> json) => _$SupplierStatementItemFromJson(json);

@override final  String id;
@override final  StatementItemType type;
@override final  double amount;
@override final  DateTime date;
@override final  String? referenceNumber;
@override final  String? notes;
@override final  double? paidAmount;
@override final  String? pharmacyId;

/// Create a copy of SupplierStatementItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierStatementItemCopyWith<_SupplierStatementItem> get copyWith => __$SupplierStatementItemCopyWithImpl<_SupplierStatementItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplierStatementItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierStatementItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.referenceNumber, referenceNumber) || other.referenceNumber == referenceNumber)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,date,referenceNumber,notes,paidAmount,pharmacyId);

@override
String toString() {
  return 'SupplierStatementItem(id: $id, type: $type, amount: $amount, date: $date, referenceNumber: $referenceNumber, notes: $notes, paidAmount: $paidAmount, pharmacyId: $pharmacyId)';
}


}

/// @nodoc
abstract mixin class _$SupplierStatementItemCopyWith<$Res> implements $SupplierStatementItemCopyWith<$Res> {
  factory _$SupplierStatementItemCopyWith(_SupplierStatementItem value, $Res Function(_SupplierStatementItem) _then) = __$SupplierStatementItemCopyWithImpl;
@override @useResult
$Res call({
 String id, StatementItemType type, double amount, DateTime date, String? referenceNumber, String? notes, double? paidAmount, String? pharmacyId
});




}
/// @nodoc
class __$SupplierStatementItemCopyWithImpl<$Res>
    implements _$SupplierStatementItemCopyWith<$Res> {
  __$SupplierStatementItemCopyWithImpl(this._self, this._then);

  final _SupplierStatementItem _self;
  final $Res Function(_SupplierStatementItem) _then;

/// Create a copy of SupplierStatementItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? amount = null,Object? date = null,Object? referenceNumber = freezed,Object? notes = freezed,Object? paidAmount = freezed,Object? pharmacyId = freezed,}) {
  return _then(_SupplierStatementItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StatementItemType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,referenceNumber: freezed == referenceNumber ? _self.referenceNumber : referenceNumber // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,paidAmount: freezed == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double?,pharmacyId: freezed == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
