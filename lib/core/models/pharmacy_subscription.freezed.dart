// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pharmacy_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PharmacySubscription {

 String get id;@JsonKey(name: 'pharmacy_id') String get pharmacyId; String get status;@JsonKey(name: 'end_date') DateTime? get endDate;@JsonKey(name: 'auto_lock') bool get autoLock;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of PharmacySubscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacySubscriptionCopyWith<PharmacySubscription> get copyWith => _$PharmacySubscriptionCopyWithImpl<PharmacySubscription>(this as PharmacySubscription, _$identity);

  /// Serializes this PharmacySubscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PharmacySubscription&&(identical(other.id, id) || other.id == id)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.status, status) || other.status == status)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.autoLock, autoLock) || other.autoLock == autoLock)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pharmacyId,status,endDate,autoLock,updatedAt);

@override
String toString() {
  return 'PharmacySubscription(id: $id, pharmacyId: $pharmacyId, status: $status, endDate: $endDate, autoLock: $autoLock, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PharmacySubscriptionCopyWith<$Res>  {
  factory $PharmacySubscriptionCopyWith(PharmacySubscription value, $Res Function(PharmacySubscription) _then) = _$PharmacySubscriptionCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'pharmacy_id') String pharmacyId, String status,@JsonKey(name: 'end_date') DateTime? endDate,@JsonKey(name: 'auto_lock') bool autoLock,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$PharmacySubscriptionCopyWithImpl<$Res>
    implements $PharmacySubscriptionCopyWith<$Res> {
  _$PharmacySubscriptionCopyWithImpl(this._self, this._then);

  final PharmacySubscription _self;
  final $Res Function(PharmacySubscription) _then;

/// Create a copy of PharmacySubscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pharmacyId = null,Object? status = null,Object? endDate = freezed,Object? autoLock = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,autoLock: null == autoLock ? _self.autoLock : autoLock // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PharmacySubscription].
extension PharmacySubscriptionPatterns on PharmacySubscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PharmacySubscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PharmacySubscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PharmacySubscription value)  $default,){
final _that = this;
switch (_that) {
case _PharmacySubscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PharmacySubscription value)?  $default,){
final _that = this;
switch (_that) {
case _PharmacySubscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'pharmacy_id')  String pharmacyId,  String status, @JsonKey(name: 'end_date')  DateTime? endDate, @JsonKey(name: 'auto_lock')  bool autoLock, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PharmacySubscription() when $default != null:
return $default(_that.id,_that.pharmacyId,_that.status,_that.endDate,_that.autoLock,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'pharmacy_id')  String pharmacyId,  String status, @JsonKey(name: 'end_date')  DateTime? endDate, @JsonKey(name: 'auto_lock')  bool autoLock, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PharmacySubscription():
return $default(_that.id,_that.pharmacyId,_that.status,_that.endDate,_that.autoLock,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'pharmacy_id')  String pharmacyId,  String status, @JsonKey(name: 'end_date')  DateTime? endDate, @JsonKey(name: 'auto_lock')  bool autoLock, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PharmacySubscription() when $default != null:
return $default(_that.id,_that.pharmacyId,_that.status,_that.endDate,_that.autoLock,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PharmacySubscription implements PharmacySubscription {
  const _PharmacySubscription({required this.id, @JsonKey(name: 'pharmacy_id') required this.pharmacyId, required this.status, @JsonKey(name: 'end_date') this.endDate, @JsonKey(name: 'auto_lock') required this.autoLock, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _PharmacySubscription.fromJson(Map<String, dynamic> json) => _$PharmacySubscriptionFromJson(json);

@override final  String id;
@override@JsonKey(name: 'pharmacy_id') final  String pharmacyId;
@override final  String status;
@override@JsonKey(name: 'end_date') final  DateTime? endDate;
@override@JsonKey(name: 'auto_lock') final  bool autoLock;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of PharmacySubscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PharmacySubscriptionCopyWith<_PharmacySubscription> get copyWith => __$PharmacySubscriptionCopyWithImpl<_PharmacySubscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PharmacySubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PharmacySubscription&&(identical(other.id, id) || other.id == id)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.status, status) || other.status == status)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.autoLock, autoLock) || other.autoLock == autoLock)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pharmacyId,status,endDate,autoLock,updatedAt);

@override
String toString() {
  return 'PharmacySubscription(id: $id, pharmacyId: $pharmacyId, status: $status, endDate: $endDate, autoLock: $autoLock, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PharmacySubscriptionCopyWith<$Res> implements $PharmacySubscriptionCopyWith<$Res> {
  factory _$PharmacySubscriptionCopyWith(_PharmacySubscription value, $Res Function(_PharmacySubscription) _then) = __$PharmacySubscriptionCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'pharmacy_id') String pharmacyId, String status,@JsonKey(name: 'end_date') DateTime? endDate,@JsonKey(name: 'auto_lock') bool autoLock,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$PharmacySubscriptionCopyWithImpl<$Res>
    implements _$PharmacySubscriptionCopyWith<$Res> {
  __$PharmacySubscriptionCopyWithImpl(this._self, this._then);

  final _PharmacySubscription _self;
  final $Res Function(_PharmacySubscription) _then;

/// Create a copy of PharmacySubscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pharmacyId = null,Object? status = null,Object? endDate = freezed,Object? autoLock = null,Object? updatedAt = freezed,}) {
  return _then(_PharmacySubscription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,autoLock: null == autoLock ? _self.autoLock : autoLock // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
