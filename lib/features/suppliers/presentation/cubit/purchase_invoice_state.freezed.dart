// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_invoice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseInvoiceState {

 List<Map<String, dynamic>> get cartItems; double get totalAmount; double get paidAmount; double get discountAmount; bool get isSaving; String? get error; bool get success; DateTime? get invoiceDate;
/// Create a copy of PurchaseInvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseInvoiceStateCopyWith<PurchaseInvoiceState> get copyWith => _$PurchaseInvoiceStateCopyWithImpl<PurchaseInvoiceState>(this as PurchaseInvoiceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseInvoiceState&&const DeepCollectionEquality().equals(other.cartItems, cartItems)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.error, error) || other.error == error)&&(identical(other.success, success) || other.success == success)&&(identical(other.invoiceDate, invoiceDate) || other.invoiceDate == invoiceDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cartItems),totalAmount,paidAmount,discountAmount,isSaving,error,success,invoiceDate);

@override
String toString() {
  return 'PurchaseInvoiceState(cartItems: $cartItems, totalAmount: $totalAmount, paidAmount: $paidAmount, discountAmount: $discountAmount, isSaving: $isSaving, error: $error, success: $success, invoiceDate: $invoiceDate)';
}


}

/// @nodoc
abstract mixin class $PurchaseInvoiceStateCopyWith<$Res>  {
  factory $PurchaseInvoiceStateCopyWith(PurchaseInvoiceState value, $Res Function(PurchaseInvoiceState) _then) = _$PurchaseInvoiceStateCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> cartItems, double totalAmount, double paidAmount, double discountAmount, bool isSaving, String? error, bool success, DateTime? invoiceDate
});




}
/// @nodoc
class _$PurchaseInvoiceStateCopyWithImpl<$Res>
    implements $PurchaseInvoiceStateCopyWith<$Res> {
  _$PurchaseInvoiceStateCopyWithImpl(this._self, this._then);

  final PurchaseInvoiceState _self;
  final $Res Function(PurchaseInvoiceState) _then;

/// Create a copy of PurchaseInvoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cartItems = null,Object? totalAmount = null,Object? paidAmount = null,Object? discountAmount = null,Object? isSaving = null,Object? error = freezed,Object? success = null,Object? invoiceDate = freezed,}) {
  return _then(_self.copyWith(
cartItems: null == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,invoiceDate: freezed == invoiceDate ? _self.invoiceDate : invoiceDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseInvoiceState].
extension PurchaseInvoiceStatePatterns on PurchaseInvoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseInvoiceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseInvoiceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseInvoiceState value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseInvoiceState value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseInvoiceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> cartItems,  double totalAmount,  double paidAmount,  double discountAmount,  bool isSaving,  String? error,  bool success,  DateTime? invoiceDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseInvoiceState() when $default != null:
return $default(_that.cartItems,_that.totalAmount,_that.paidAmount,_that.discountAmount,_that.isSaving,_that.error,_that.success,_that.invoiceDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Map<String, dynamic>> cartItems,  double totalAmount,  double paidAmount,  double discountAmount,  bool isSaving,  String? error,  bool success,  DateTime? invoiceDate)  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceState():
return $default(_that.cartItems,_that.totalAmount,_that.paidAmount,_that.discountAmount,_that.isSaving,_that.error,_that.success,_that.invoiceDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Map<String, dynamic>> cartItems,  double totalAmount,  double paidAmount,  double discountAmount,  bool isSaving,  String? error,  bool success,  DateTime? invoiceDate)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseInvoiceState() when $default != null:
return $default(_that.cartItems,_that.totalAmount,_that.paidAmount,_that.discountAmount,_that.isSaving,_that.error,_that.success,_that.invoiceDate);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseInvoiceState implements PurchaseInvoiceState {
  const _PurchaseInvoiceState({final  List<Map<String, dynamic>> cartItems = const [], this.totalAmount = 0.0, this.paidAmount = 0.0, this.discountAmount = 0.0, this.isSaving = false, this.error, this.success = false, this.invoiceDate}): _cartItems = cartItems;
  

 final  List<Map<String, dynamic>> _cartItems;
@override@JsonKey() List<Map<String, dynamic>> get cartItems {
  if (_cartItems is EqualUnmodifiableListView) return _cartItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartItems);
}

@override@JsonKey() final  double totalAmount;
@override@JsonKey() final  double paidAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  bool isSaving;
@override final  String? error;
@override@JsonKey() final  bool success;
@override final  DateTime? invoiceDate;

/// Create a copy of PurchaseInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseInvoiceStateCopyWith<_PurchaseInvoiceState> get copyWith => __$PurchaseInvoiceStateCopyWithImpl<_PurchaseInvoiceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseInvoiceState&&const DeepCollectionEquality().equals(other._cartItems, _cartItems)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.error, error) || other.error == error)&&(identical(other.success, success) || other.success == success)&&(identical(other.invoiceDate, invoiceDate) || other.invoiceDate == invoiceDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cartItems),totalAmount,paidAmount,discountAmount,isSaving,error,success,invoiceDate);

@override
String toString() {
  return 'PurchaseInvoiceState(cartItems: $cartItems, totalAmount: $totalAmount, paidAmount: $paidAmount, discountAmount: $discountAmount, isSaving: $isSaving, error: $error, success: $success, invoiceDate: $invoiceDate)';
}


}

/// @nodoc
abstract mixin class _$PurchaseInvoiceStateCopyWith<$Res> implements $PurchaseInvoiceStateCopyWith<$Res> {
  factory _$PurchaseInvoiceStateCopyWith(_PurchaseInvoiceState value, $Res Function(_PurchaseInvoiceState) _then) = __$PurchaseInvoiceStateCopyWithImpl;
@override @useResult
$Res call({
 List<Map<String, dynamic>> cartItems, double totalAmount, double paidAmount, double discountAmount, bool isSaving, String? error, bool success, DateTime? invoiceDate
});




}
/// @nodoc
class __$PurchaseInvoiceStateCopyWithImpl<$Res>
    implements _$PurchaseInvoiceStateCopyWith<$Res> {
  __$PurchaseInvoiceStateCopyWithImpl(this._self, this._then);

  final _PurchaseInvoiceState _self;
  final $Res Function(_PurchaseInvoiceState) _then;

/// Create a copy of PurchaseInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cartItems = null,Object? totalAmount = null,Object? paidAmount = null,Object? discountAmount = null,Object? isSaving = null,Object? error = freezed,Object? success = null,Object? invoiceDate = freezed,}) {
  return _then(_PurchaseInvoiceState(
cartItems: null == cartItems ? _self._cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,invoiceDate: freezed == invoiceDate ? _self.invoiceDate : invoiceDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
