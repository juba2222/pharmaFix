// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CashSession {

 String get id;@JsonKey(name: 'pharmacy_id') String get pharmacyId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'start_time') DateTime get startTime;@JsonKey(name: 'end_time') DateTime? get endTime;@JsonKey(name: 'opening_balance') double? get openingBalance;@JsonKey(name: 'total_sales') double get totalSales; String get status;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of CashSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashSessionCopyWith<CashSession> get copyWith => _$CashSessionCopyWithImpl<CashSession>(this as CashSession, _$identity);

  /// Serializes this CashSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashSession&&(identical(other.id, id) || other.id == id)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.openingBalance, openingBalance) || other.openingBalance == openingBalance)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pharmacyId,userId,startTime,endTime,openingBalance,totalSales,status,updatedAt);

@override
String toString() {
  return 'CashSession(id: $id, pharmacyId: $pharmacyId, userId: $userId, startTime: $startTime, endTime: $endTime, openingBalance: $openingBalance, totalSales: $totalSales, status: $status, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CashSessionCopyWith<$Res>  {
  factory $CashSessionCopyWith(CashSession value, $Res Function(CashSession) _then) = _$CashSessionCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'pharmacy_id') String pharmacyId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime? endTime,@JsonKey(name: 'opening_balance') double? openingBalance,@JsonKey(name: 'total_sales') double totalSales, String status,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$CashSessionCopyWithImpl<$Res>
    implements $CashSessionCopyWith<$Res> {
  _$CashSessionCopyWithImpl(this._self, this._then);

  final CashSession _self;
  final $Res Function(CashSession) _then;

/// Create a copy of CashSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pharmacyId = null,Object? userId = null,Object? startTime = null,Object? endTime = freezed,Object? openingBalance = freezed,Object? totalSales = null,Object? status = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,openingBalance: freezed == openingBalance ? _self.openingBalance : openingBalance // ignore: cast_nullable_to_non_nullable
as double?,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CashSession].
extension CashSessionPatterns on CashSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashSession value)  $default,){
final _that = this;
switch (_that) {
case _CashSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashSession value)?  $default,){
final _that = this;
switch (_that) {
case _CashSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'pharmacy_id')  String pharmacyId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime? endTime, @JsonKey(name: 'opening_balance')  double? openingBalance, @JsonKey(name: 'total_sales')  double totalSales,  String status, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashSession() when $default != null:
return $default(_that.id,_that.pharmacyId,_that.userId,_that.startTime,_that.endTime,_that.openingBalance,_that.totalSales,_that.status,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'pharmacy_id')  String pharmacyId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime? endTime, @JsonKey(name: 'opening_balance')  double? openingBalance, @JsonKey(name: 'total_sales')  double totalSales,  String status, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CashSession():
return $default(_that.id,_that.pharmacyId,_that.userId,_that.startTime,_that.endTime,_that.openingBalance,_that.totalSales,_that.status,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'pharmacy_id')  String pharmacyId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime? endTime, @JsonKey(name: 'opening_balance')  double? openingBalance, @JsonKey(name: 'total_sales')  double totalSales,  String status, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CashSession() when $default != null:
return $default(_that.id,_that.pharmacyId,_that.userId,_that.startTime,_that.endTime,_that.openingBalance,_that.totalSales,_that.status,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashSession implements CashSession {
  const _CashSession({required this.id, @JsonKey(name: 'pharmacy_id') required this.pharmacyId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') this.endTime, @JsonKey(name: 'opening_balance') this.openingBalance, @JsonKey(name: 'total_sales') required this.totalSales, required this.status, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _CashSession.fromJson(Map<String, dynamic> json) => _$CashSessionFromJson(json);

@override final  String id;
@override@JsonKey(name: 'pharmacy_id') final  String pharmacyId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'start_time') final  DateTime startTime;
@override@JsonKey(name: 'end_time') final  DateTime? endTime;
@override@JsonKey(name: 'opening_balance') final  double? openingBalance;
@override@JsonKey(name: 'total_sales') final  double totalSales;
@override final  String status;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of CashSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashSessionCopyWith<_CashSession> get copyWith => __$CashSessionCopyWithImpl<_CashSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashSession&&(identical(other.id, id) || other.id == id)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.openingBalance, openingBalance) || other.openingBalance == openingBalance)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pharmacyId,userId,startTime,endTime,openingBalance,totalSales,status,updatedAt);

@override
String toString() {
  return 'CashSession(id: $id, pharmacyId: $pharmacyId, userId: $userId, startTime: $startTime, endTime: $endTime, openingBalance: $openingBalance, totalSales: $totalSales, status: $status, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CashSessionCopyWith<$Res> implements $CashSessionCopyWith<$Res> {
  factory _$CashSessionCopyWith(_CashSession value, $Res Function(_CashSession) _then) = __$CashSessionCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'pharmacy_id') String pharmacyId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime? endTime,@JsonKey(name: 'opening_balance') double? openingBalance,@JsonKey(name: 'total_sales') double totalSales, String status,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$CashSessionCopyWithImpl<$Res>
    implements _$CashSessionCopyWith<$Res> {
  __$CashSessionCopyWithImpl(this._self, this._then);

  final _CashSession _self;
  final $Res Function(_CashSession) _then;

/// Create a copy of CashSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pharmacyId = null,Object? userId = null,Object? startTime = null,Object? endTime = freezed,Object? openingBalance = freezed,Object? totalSales = null,Object? status = null,Object? updatedAt = freezed,}) {
  return _then(_CashSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,openingBalance: freezed == openingBalance ? _self.openingBalance : openingBalance // ignore: cast_nullable_to_non_nullable
as double?,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
