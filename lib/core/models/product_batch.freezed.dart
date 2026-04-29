// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductBatch {

 String get id;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'pharmacy_id') String get pharmacyId;@JsonKey(name: 'batch_number') String get batchNumber;@JsonKey(name: 'expiry_date') DateTime get expiryDate;@JsonKey(name: 'quantity_base_unit') double get quantityBaseUnit;@JsonKey(name: 'purchase_price') double? get purchasePrice;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of ProductBatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductBatchCopyWith<ProductBatch> get copyWith => _$ProductBatchCopyWithImpl<ProductBatch>(this as ProductBatch, _$identity);

  /// Serializes this ProductBatch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.quantityBaseUnit, quantityBaseUnit) || other.quantityBaseUnit == quantityBaseUnit)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,pharmacyId,batchNumber,expiryDate,quantityBaseUnit,purchasePrice,updatedAt,createdAt);

@override
String toString() {
  return 'ProductBatch(id: $id, productId: $productId, pharmacyId: $pharmacyId, batchNumber: $batchNumber, expiryDate: $expiryDate, quantityBaseUnit: $quantityBaseUnit, purchasePrice: $purchasePrice, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ProductBatchCopyWith<$Res>  {
  factory $ProductBatchCopyWith(ProductBatch value, $Res Function(ProductBatch) _then) = _$ProductBatchCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'pharmacy_id') String pharmacyId,@JsonKey(name: 'batch_number') String batchNumber,@JsonKey(name: 'expiry_date') DateTime expiryDate,@JsonKey(name: 'quantity_base_unit') double quantityBaseUnit,@JsonKey(name: 'purchase_price') double? purchasePrice,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$ProductBatchCopyWithImpl<$Res>
    implements $ProductBatchCopyWith<$Res> {
  _$ProductBatchCopyWithImpl(this._self, this._then);

  final ProductBatch _self;
  final $Res Function(ProductBatch) _then;

/// Create a copy of ProductBatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? pharmacyId = null,Object? batchNumber = null,Object? expiryDate = null,Object? quantityBaseUnit = null,Object? purchasePrice = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantityBaseUnit: null == quantityBaseUnit ? _self.quantityBaseUnit : quantityBaseUnit // ignore: cast_nullable_to_non_nullable
as double,purchasePrice: freezed == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as double?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductBatch].
extension ProductBatchPatterns on ProductBatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductBatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductBatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductBatch value)  $default,){
final _that = this;
switch (_that) {
case _ProductBatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductBatch value)?  $default,){
final _that = this;
switch (_that) {
case _ProductBatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'pharmacy_id')  String pharmacyId, @JsonKey(name: 'batch_number')  String batchNumber, @JsonKey(name: 'expiry_date')  DateTime expiryDate, @JsonKey(name: 'quantity_base_unit')  double quantityBaseUnit, @JsonKey(name: 'purchase_price')  double? purchasePrice, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductBatch() when $default != null:
return $default(_that.id,_that.productId,_that.pharmacyId,_that.batchNumber,_that.expiryDate,_that.quantityBaseUnit,_that.purchasePrice,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'pharmacy_id')  String pharmacyId, @JsonKey(name: 'batch_number')  String batchNumber, @JsonKey(name: 'expiry_date')  DateTime expiryDate, @JsonKey(name: 'quantity_base_unit')  double quantityBaseUnit, @JsonKey(name: 'purchase_price')  double? purchasePrice, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ProductBatch():
return $default(_that.id,_that.productId,_that.pharmacyId,_that.batchNumber,_that.expiryDate,_that.quantityBaseUnit,_that.purchasePrice,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'pharmacy_id')  String pharmacyId, @JsonKey(name: 'batch_number')  String batchNumber, @JsonKey(name: 'expiry_date')  DateTime expiryDate, @JsonKey(name: 'quantity_base_unit')  double quantityBaseUnit, @JsonKey(name: 'purchase_price')  double? purchasePrice, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ProductBatch() when $default != null:
return $default(_that.id,_that.productId,_that.pharmacyId,_that.batchNumber,_that.expiryDate,_that.quantityBaseUnit,_that.purchasePrice,_that.updatedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductBatch implements ProductBatch {
  const _ProductBatch({required this.id, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'pharmacy_id') required this.pharmacyId, @JsonKey(name: 'batch_number') required this.batchNumber, @JsonKey(name: 'expiry_date') required this.expiryDate, @JsonKey(name: 'quantity_base_unit') required this.quantityBaseUnit, @JsonKey(name: 'purchase_price') this.purchasePrice, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'created_at') this.createdAt});
  factory _ProductBatch.fromJson(Map<String, dynamic> json) => _$ProductBatchFromJson(json);

@override final  String id;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'pharmacy_id') final  String pharmacyId;
@override@JsonKey(name: 'batch_number') final  String batchNumber;
@override@JsonKey(name: 'expiry_date') final  DateTime expiryDate;
@override@JsonKey(name: 'quantity_base_unit') final  double quantityBaseUnit;
@override@JsonKey(name: 'purchase_price') final  double? purchasePrice;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of ProductBatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductBatchCopyWith<_ProductBatch> get copyWith => __$ProductBatchCopyWithImpl<_ProductBatch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductBatchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductBatch&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.batchNumber, batchNumber) || other.batchNumber == batchNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.quantityBaseUnit, quantityBaseUnit) || other.quantityBaseUnit == quantityBaseUnit)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,pharmacyId,batchNumber,expiryDate,quantityBaseUnit,purchasePrice,updatedAt,createdAt);

@override
String toString() {
  return 'ProductBatch(id: $id, productId: $productId, pharmacyId: $pharmacyId, batchNumber: $batchNumber, expiryDate: $expiryDate, quantityBaseUnit: $quantityBaseUnit, purchasePrice: $purchasePrice, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProductBatchCopyWith<$Res> implements $ProductBatchCopyWith<$Res> {
  factory _$ProductBatchCopyWith(_ProductBatch value, $Res Function(_ProductBatch) _then) = __$ProductBatchCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'pharmacy_id') String pharmacyId,@JsonKey(name: 'batch_number') String batchNumber,@JsonKey(name: 'expiry_date') DateTime expiryDate,@JsonKey(name: 'quantity_base_unit') double quantityBaseUnit,@JsonKey(name: 'purchase_price') double? purchasePrice,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$ProductBatchCopyWithImpl<$Res>
    implements _$ProductBatchCopyWith<$Res> {
  __$ProductBatchCopyWithImpl(this._self, this._then);

  final _ProductBatch _self;
  final $Res Function(_ProductBatch) _then;

/// Create a copy of ProductBatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? pharmacyId = null,Object? batchNumber = null,Object? expiryDate = null,Object? quantityBaseUnit = null,Object? purchasePrice = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_ProductBatch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,batchNumber: null == batchNumber ? _self.batchNumber : batchNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,quantityBaseUnit: null == quantityBaseUnit ? _self.quantityBaseUnit : quantityBaseUnit // ignore: cast_nullable_to_non_nullable
as double,purchasePrice: freezed == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as double?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
