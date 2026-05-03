// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SupplierEntity {

 String get id; String get pharmacyId; String get name; String? get companyName; String? get phone; double get openingBalance; double get currentBalance; DateTime get createdAt;
/// Create a copy of SupplierEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierEntityCopyWith<SupplierEntity> get copyWith => _$SupplierEntityCopyWithImpl<SupplierEntity>(this as SupplierEntity, _$identity);

  /// Serializes this SupplierEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierEntity&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.openingBalance, openingBalance) || other.openingBalance == openingBalance)&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,id,pharmacyId,name,companyName,phone,openingBalance,currentBalance,createdAt);



}

/// @nodoc
abstract mixin class $SupplierEntityCopyWith<$Res>  {
  factory $SupplierEntityCopyWith(SupplierEntity value, $Res Function(SupplierEntity) _then) = _$SupplierEntityCopyWithImpl;
@useResult
$Res call({
 String id, String pharmacyId, String name, String? companyName, String? phone, double openingBalance, double currentBalance, DateTime createdAt
});




}
/// @nodoc
class _$SupplierEntityCopyWithImpl<$Res>
    implements $SupplierEntityCopyWith<$Res> {
  _$SupplierEntityCopyWithImpl(this._self, this._then);

  final SupplierEntity _self;
  final $Res Function(SupplierEntity) _then;

/// Create a copy of SupplierEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pharmacyId = null,Object? name = null,Object? companyName = freezed,Object? phone = freezed,Object? openingBalance = null,Object? currentBalance = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,openingBalance: null == openingBalance ? _self.openingBalance : openingBalance // ignore: cast_nullable_to_non_nullable
as double,currentBalance: null == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierEntity].
extension SupplierEntityPatterns on SupplierEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierEntity value)  $default,){
final _that = this;
switch (_that) {
case _SupplierEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String pharmacyId,  String name,  String? companyName,  String? phone,  double openingBalance,  double currentBalance,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierEntity() when $default != null:
return $default(_that.id,_that.pharmacyId,_that.name,_that.companyName,_that.phone,_that.openingBalance,_that.currentBalance,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String pharmacyId,  String name,  String? companyName,  String? phone,  double openingBalance,  double currentBalance,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _SupplierEntity():
return $default(_that.id,_that.pharmacyId,_that.name,_that.companyName,_that.phone,_that.openingBalance,_that.currentBalance,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String pharmacyId,  String name,  String? companyName,  String? phone,  double openingBalance,  double currentBalance,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SupplierEntity() when $default != null:
return $default(_that.id,_that.pharmacyId,_that.name,_that.companyName,_that.phone,_that.openingBalance,_that.currentBalance,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupplierEntity extends SupplierEntity {
  const _SupplierEntity({required this.id, required this.pharmacyId, required this.name, this.companyName, this.phone, required this.openingBalance, this.currentBalance = 0.0, required this.createdAt}): super._();
  factory _SupplierEntity.fromJson(Map<String, dynamic> json) => _$SupplierEntityFromJson(json);

@override final  String id;
@override final  String pharmacyId;
@override final  String name;
@override final  String? companyName;
@override final  String? phone;
@override final  double openingBalance;
@override@JsonKey() final  double currentBalance;
@override final  DateTime createdAt;

/// Create a copy of SupplierEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierEntityCopyWith<_SupplierEntity> get copyWith => __$SupplierEntityCopyWithImpl<_SupplierEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupplierEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierEntity&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.name, name) || other.name == name)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.openingBalance, openingBalance) || other.openingBalance == openingBalance)&&(identical(other.currentBalance, currentBalance) || other.currentBalance == currentBalance)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,id,pharmacyId,name,companyName,phone,openingBalance,currentBalance,createdAt);



}

/// @nodoc
abstract mixin class _$SupplierEntityCopyWith<$Res> implements $SupplierEntityCopyWith<$Res> {
  factory _$SupplierEntityCopyWith(_SupplierEntity value, $Res Function(_SupplierEntity) _then) = __$SupplierEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String pharmacyId, String name, String? companyName, String? phone, double openingBalance, double currentBalance, DateTime createdAt
});




}
/// @nodoc
class __$SupplierEntityCopyWithImpl<$Res>
    implements _$SupplierEntityCopyWith<$Res> {
  __$SupplierEntityCopyWithImpl(this._self, this._then);

  final _SupplierEntity _self;
  final $Res Function(_SupplierEntity) _then;

/// Create a copy of SupplierEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pharmacyId = null,Object? name = null,Object? companyName = freezed,Object? phone = freezed,Object? openingBalance = null,Object? currentBalance = null,Object? createdAt = null,}) {
  return _then(_SupplierEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,openingBalance: null == openingBalance ? _self.openingBalance : openingBalance // ignore: cast_nullable_to_non_nullable
as double,currentBalance: null == currentBalance ? _self.currentBalance : currentBalance // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
