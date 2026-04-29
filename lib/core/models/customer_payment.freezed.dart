// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerPayment {

 String get id;@JsonKey(name: 'customer_id') String get customerId; double get amount;@JsonKey(name: 'payment_date') DateTime get paymentDate;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of CustomerPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerPaymentCopyWith<CustomerPayment> get copyWith => _$CustomerPaymentCopyWithImpl<CustomerPayment>(this as CustomerPayment, _$identity);

  /// Serializes this CustomerPayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerPayment&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,amount,paymentDate,updatedAt);

@override
String toString() {
  return 'CustomerPayment(id: $id, customerId: $customerId, amount: $amount, paymentDate: $paymentDate, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomerPaymentCopyWith<$Res>  {
  factory $CustomerPaymentCopyWith(CustomerPayment value, $Res Function(CustomerPayment) _then) = _$CustomerPaymentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'customer_id') String customerId, double amount,@JsonKey(name: 'payment_date') DateTime paymentDate,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$CustomerPaymentCopyWithImpl<$Res>
    implements $CustomerPaymentCopyWith<$Res> {
  _$CustomerPaymentCopyWithImpl(this._self, this._then);

  final CustomerPayment _self;
  final $Res Function(CustomerPayment) _then;

/// Create a copy of CustomerPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? amount = null,Object? paymentDate = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentDate: null == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerPayment].
extension CustomerPaymentPatterns on CustomerPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerPayment value)  $default,){
final _that = this;
switch (_that) {
case _CustomerPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerPayment value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'customer_id')  String customerId,  double amount, @JsonKey(name: 'payment_date')  DateTime paymentDate, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerPayment() when $default != null:
return $default(_that.id,_that.customerId,_that.amount,_that.paymentDate,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'customer_id')  String customerId,  double amount, @JsonKey(name: 'payment_date')  DateTime paymentDate, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CustomerPayment():
return $default(_that.id,_that.customerId,_that.amount,_that.paymentDate,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'customer_id')  String customerId,  double amount, @JsonKey(name: 'payment_date')  DateTime paymentDate, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CustomerPayment() when $default != null:
return $default(_that.id,_that.customerId,_that.amount,_that.paymentDate,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerPayment implements CustomerPayment {
  const _CustomerPayment({required this.id, @JsonKey(name: 'customer_id') required this.customerId, required this.amount, @JsonKey(name: 'payment_date') required this.paymentDate, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _CustomerPayment.fromJson(Map<String, dynamic> json) => _$CustomerPaymentFromJson(json);

@override final  String id;
@override@JsonKey(name: 'customer_id') final  String customerId;
@override final  double amount;
@override@JsonKey(name: 'payment_date') final  DateTime paymentDate;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of CustomerPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerPaymentCopyWith<_CustomerPayment> get copyWith => __$CustomerPaymentCopyWithImpl<_CustomerPayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerPaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerPayment&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,amount,paymentDate,updatedAt);

@override
String toString() {
  return 'CustomerPayment(id: $id, customerId: $customerId, amount: $amount, paymentDate: $paymentDate, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CustomerPaymentCopyWith<$Res> implements $CustomerPaymentCopyWith<$Res> {
  factory _$CustomerPaymentCopyWith(_CustomerPayment value, $Res Function(_CustomerPayment) _then) = __$CustomerPaymentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'customer_id') String customerId, double amount,@JsonKey(name: 'payment_date') DateTime paymentDate,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$CustomerPaymentCopyWithImpl<$Res>
    implements _$CustomerPaymentCopyWith<$Res> {
  __$CustomerPaymentCopyWithImpl(this._self, this._then);

  final _CustomerPayment _self;
  final $Res Function(_CustomerPayment) _then;

/// Create a copy of CustomerPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? amount = null,Object? paymentDate = null,Object? updatedAt = freezed,}) {
  return _then(_CustomerPayment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentDate: null == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
