// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write_off_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WriteOffEntity {

 String get id; String get pharmacyId; String get productId; String get batchId; String get unitId; double get quantity; double get costPriceAtTime; String get reason; DateTime get createdAt;
/// Create a copy of WriteOffEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WriteOffEntityCopyWith<WriteOffEntity> get copyWith => _$WriteOffEntityCopyWithImpl<WriteOffEntity>(this as WriteOffEntity, _$identity);

  /// Serializes this WriteOffEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WriteOffEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.batchId, batchId) || other.batchId == batchId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPriceAtTime, costPriceAtTime) || other.costPriceAtTime == costPriceAtTime)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pharmacyId,productId,batchId,unitId,quantity,costPriceAtTime,reason,createdAt);

@override
String toString() {
  return 'WriteOffEntity(id: $id, pharmacyId: $pharmacyId, productId: $productId, batchId: $batchId, unitId: $unitId, quantity: $quantity, costPriceAtTime: $costPriceAtTime, reason: $reason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $WriteOffEntityCopyWith<$Res>  {
  factory $WriteOffEntityCopyWith(WriteOffEntity value, $Res Function(WriteOffEntity) _then) = _$WriteOffEntityCopyWithImpl;
@useResult
$Res call({
 String id, String pharmacyId, String productId, String batchId, String unitId, double quantity, double costPriceAtTime, String reason, DateTime createdAt
});




}
/// @nodoc
class _$WriteOffEntityCopyWithImpl<$Res>
    implements $WriteOffEntityCopyWith<$Res> {
  _$WriteOffEntityCopyWithImpl(this._self, this._then);

  final WriteOffEntity _self;
  final $Res Function(WriteOffEntity) _then;

/// Create a copy of WriteOffEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pharmacyId = null,Object? productId = null,Object? batchId = null,Object? unitId = null,Object? quantity = null,Object? costPriceAtTime = null,Object? reason = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,batchId: null == batchId ? _self.batchId : batchId // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPriceAtTime: null == costPriceAtTime ? _self.costPriceAtTime : costPriceAtTime // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WriteOffEntity].
extension WriteOffEntityPatterns on WriteOffEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WriteOffEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WriteOffEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WriteOffEntity value)  $default,){
final _that = this;
switch (_that) {
case _WriteOffEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WriteOffEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WriteOffEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String pharmacyId,  String productId,  String batchId,  String unitId,  double quantity,  double costPriceAtTime,  String reason,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WriteOffEntity() when $default != null:
return $default(_that.id,_that.pharmacyId,_that.productId,_that.batchId,_that.unitId,_that.quantity,_that.costPriceAtTime,_that.reason,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String pharmacyId,  String productId,  String batchId,  String unitId,  double quantity,  double costPriceAtTime,  String reason,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _WriteOffEntity():
return $default(_that.id,_that.pharmacyId,_that.productId,_that.batchId,_that.unitId,_that.quantity,_that.costPriceAtTime,_that.reason,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String pharmacyId,  String productId,  String batchId,  String unitId,  double quantity,  double costPriceAtTime,  String reason,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _WriteOffEntity() when $default != null:
return $default(_that.id,_that.pharmacyId,_that.productId,_that.batchId,_that.unitId,_that.quantity,_that.costPriceAtTime,_that.reason,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WriteOffEntity implements WriteOffEntity {
  const _WriteOffEntity({required this.id, required this.pharmacyId, required this.productId, required this.batchId, required this.unitId, required this.quantity, this.costPriceAtTime = 0.0, required this.reason, required this.createdAt});
  factory _WriteOffEntity.fromJson(Map<String, dynamic> json) => _$WriteOffEntityFromJson(json);

@override final  String id;
@override final  String pharmacyId;
@override final  String productId;
@override final  String batchId;
@override final  String unitId;
@override final  double quantity;
@override@JsonKey() final  double costPriceAtTime;
@override final  String reason;
@override final  DateTime createdAt;

/// Create a copy of WriteOffEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WriteOffEntityCopyWith<_WriteOffEntity> get copyWith => __$WriteOffEntityCopyWithImpl<_WriteOffEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WriteOffEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WriteOffEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.batchId, batchId) || other.batchId == batchId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.costPriceAtTime, costPriceAtTime) || other.costPriceAtTime == costPriceAtTime)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pharmacyId,productId,batchId,unitId,quantity,costPriceAtTime,reason,createdAt);

@override
String toString() {
  return 'WriteOffEntity(id: $id, pharmacyId: $pharmacyId, productId: $productId, batchId: $batchId, unitId: $unitId, quantity: $quantity, costPriceAtTime: $costPriceAtTime, reason: $reason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$WriteOffEntityCopyWith<$Res> implements $WriteOffEntityCopyWith<$Res> {
  factory _$WriteOffEntityCopyWith(_WriteOffEntity value, $Res Function(_WriteOffEntity) _then) = __$WriteOffEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String pharmacyId, String productId, String batchId, String unitId, double quantity, double costPriceAtTime, String reason, DateTime createdAt
});




}
/// @nodoc
class __$WriteOffEntityCopyWithImpl<$Res>
    implements _$WriteOffEntityCopyWith<$Res> {
  __$WriteOffEntityCopyWithImpl(this._self, this._then);

  final _WriteOffEntity _self;
  final $Res Function(_WriteOffEntity) _then;

/// Create a copy of WriteOffEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pharmacyId = null,Object? productId = null,Object? batchId = null,Object? unitId = null,Object? quantity = null,Object? costPriceAtTime = null,Object? reason = null,Object? createdAt = null,}) {
  return _then(_WriteOffEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,batchId: null == batchId ? _self.batchId : batchId // ignore: cast_nullable_to_non_nullable
as String,unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,costPriceAtTime: null == costPriceAtTime ? _self.costPriceAtTime : costPriceAtTime // ignore: cast_nullable_to_non_nullable
as double,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
