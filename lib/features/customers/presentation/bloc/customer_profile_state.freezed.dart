// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerProfileState()';
}


}

/// @nodoc
class $CustomerProfileStateCopyWith<$Res>  {
$CustomerProfileStateCopyWith(CustomerProfileState _, $Res Function(CustomerProfileState) __);
}


/// Adds pattern-matching-related methods to [CustomerProfileState].
extension CustomerProfileStatePatterns on CustomerProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( double currentBalance,  double creditLimit,  double totalPurchases,  DateTime? lastSale,  int invoiceCount,  List<Map<String, dynamic>> salesHistory)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.currentBalance,_that.creditLimit,_that.totalPurchases,_that.lastSale,_that.invoiceCount,_that.salesHistory);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( double currentBalance,  double creditLimit,  double totalPurchases,  DateTime? lastSale,  int invoiceCount,  List<Map<String, dynamic>> salesHistory)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.currentBalance,_that.creditLimit,_that.totalPurchases,_that.lastSale,_that.invoiceCount,_that.salesHistory);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( double currentBalance,  double creditLimit,  double totalPurchases,  DateTime? lastSale,  int invoiceCount,  List<Map<String, dynamic>> salesHistory)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.currentBalance,_that.creditLimit,_that.totalPurchases,_that.lastSale,_that.invoiceCount,_that.salesHistory);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CustomerProfileState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerProfileState.initial()';
}


}




/// @nodoc


class _Loading implements CustomerProfileState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerProfileState.loading()';
}


}




/// @nodoc


class _Loaded implements CustomerProfileState {
  const _Loaded({required this.currentBalance, required this.creditLimit, required this.totalPurchases, this.lastSale, required this.invoiceCount, required final  List<Map<String, dynamic>> salesHistory}): _salesHistory = salesHistory;
  

 final  double currentBalance;
 final  double creditLimit;
 final  double totalPurchases;
 final  DateTime? lastSale;
 final  int invoiceCount;
 final  List<Map<String, dynamic>> _salesHistory;
 List<Map<String, dynamic>> get salesHistory {
  if (_salesHistory is EqualUnmodifiableListView) return _salesHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_salesHistory);
}


/// Create a copy of CustomerProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&(identical(other.creditLimit, creditLimit) || other.creditLimit == creditLimit)&&(identical(other.totalPurchases, totalPurchases) || other.totalPurchases == totalPurchases)&&(identical(other.lastSale, lastSale) || other.lastSale == lastSale)&&(identical(other.invoiceCount, invoiceCount) || other.invoiceCount == invoiceCount)&&const DeepCollectionEquality().equals(other._salesHistory, _salesHistory));
}


@override
int get hashCode => Object.hash(runtimeType,currentBalance,creditLimit,totalPurchases,lastSale,invoiceCount,const DeepCollectionEquality().hash(_salesHistory));

@override
String toString() {
  return 'CustomerProfileState.loaded(currentBalance: $currentBalance, creditLimit: $creditLimit, totalPurchases: $totalPurchases, lastSale: $lastSale, invoiceCount: $invoiceCount, salesHistory: $salesHistory)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CustomerProfileStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 double currentBalance, double creditLimit, double totalPurchases, DateTime? lastSale, int invoiceCount, List<Map<String, dynamic>> salesHistory
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CustomerProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentBalance = null,Object? creditLimit = null,Object? totalPurchases = null,Object? lastSale = freezed,Object? invoiceCount = null,Object? salesHistory = null,}) {
  return _then(_Loaded(
currentBalance: null == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as double,creditLimit: null == creditLimit ? _self.creditLimit : creditLimit // ignore: cast_nullable_to_non_nullable
as double,totalPurchases: null == totalPurchases ? _self.totalPurchases : totalPurchases // ignore: cast_nullable_to_non_nullable
as double,lastSale: freezed == lastSale ? _self.lastSale : lastSale // ignore: cast_nullable_to_non_nullable
as DateTime?,invoiceCount: null == invoiceCount ? _self.invoiceCount : invoiceCount // ignore: cast_nullable_to_non_nullable
as int,salesHistory: null == salesHistory ? _self._salesHistory : salesHistory // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

/// @nodoc


class _Error implements CustomerProfileState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of CustomerProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CustomerProfileState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CustomerProfileStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of CustomerProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
