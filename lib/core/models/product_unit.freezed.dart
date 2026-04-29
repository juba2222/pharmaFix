// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductUnit {

 String get id;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'pharmacy_id') String get pharmacyId;@JsonKey(name: 'unit_name') String get unitName;@JsonKey(name: 'conversion_factor') double get conversionFactor;@JsonKey(name: 'cost_price') double get costPrice;@JsonKey(name: 'selling_price') double get sellingPrice; String? get barcode;@JsonKey(name: 'is_base_unit') bool get isBaseUnit;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of ProductUnit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductUnitCopyWith<ProductUnit> get copyWith => _$ProductUnitCopyWithImpl<ProductUnit>(this as ProductUnit, _$identity);

  /// Serializes this ProductUnit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductUnit&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.conversionFactor, conversionFactor) || other.conversionFactor == conversionFactor)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.isBaseUnit, isBaseUnit) || other.isBaseUnit == isBaseUnit)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,pharmacyId,unitName,conversionFactor,costPrice,sellingPrice,barcode,isBaseUnit,updatedAt,createdAt);

@override
String toString() {
  return 'ProductUnit(id: $id, productId: $productId, pharmacyId: $pharmacyId, unitName: $unitName, conversionFactor: $conversionFactor, costPrice: $costPrice, sellingPrice: $sellingPrice, barcode: $barcode, isBaseUnit: $isBaseUnit, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ProductUnitCopyWith<$Res>  {
  factory $ProductUnitCopyWith(ProductUnit value, $Res Function(ProductUnit) _then) = _$ProductUnitCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'pharmacy_id') String pharmacyId,@JsonKey(name: 'unit_name') String unitName,@JsonKey(name: 'conversion_factor') double conversionFactor,@JsonKey(name: 'cost_price') double costPrice,@JsonKey(name: 'selling_price') double sellingPrice, String? barcode,@JsonKey(name: 'is_base_unit') bool isBaseUnit,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$ProductUnitCopyWithImpl<$Res>
    implements $ProductUnitCopyWith<$Res> {
  _$ProductUnitCopyWithImpl(this._self, this._then);

  final ProductUnit _self;
  final $Res Function(ProductUnit) _then;

/// Create a copy of ProductUnit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? pharmacyId = null,Object? unitName = null,Object? conversionFactor = null,Object? costPrice = null,Object? sellingPrice = null,Object? barcode = freezed,Object? isBaseUnit = null,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,unitName: null == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String,conversionFactor: null == conversionFactor ? _self.conversionFactor : conversionFactor // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as double,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,isBaseUnit: null == isBaseUnit ? _self.isBaseUnit : isBaseUnit // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductUnit].
extension ProductUnitPatterns on ProductUnit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductUnit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductUnit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductUnit value)  $default,){
final _that = this;
switch (_that) {
case _ProductUnit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductUnit value)?  $default,){
final _that = this;
switch (_that) {
case _ProductUnit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'pharmacy_id')  String pharmacyId, @JsonKey(name: 'unit_name')  String unitName, @JsonKey(name: 'conversion_factor')  double conversionFactor, @JsonKey(name: 'cost_price')  double costPrice, @JsonKey(name: 'selling_price')  double sellingPrice,  String? barcode, @JsonKey(name: 'is_base_unit')  bool isBaseUnit, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductUnit() when $default != null:
return $default(_that.id,_that.productId,_that.pharmacyId,_that.unitName,_that.conversionFactor,_that.costPrice,_that.sellingPrice,_that.barcode,_that.isBaseUnit,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'pharmacy_id')  String pharmacyId, @JsonKey(name: 'unit_name')  String unitName, @JsonKey(name: 'conversion_factor')  double conversionFactor, @JsonKey(name: 'cost_price')  double costPrice, @JsonKey(name: 'selling_price')  double sellingPrice,  String? barcode, @JsonKey(name: 'is_base_unit')  bool isBaseUnit, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ProductUnit():
return $default(_that.id,_that.productId,_that.pharmacyId,_that.unitName,_that.conversionFactor,_that.costPrice,_that.sellingPrice,_that.barcode,_that.isBaseUnit,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'pharmacy_id')  String pharmacyId, @JsonKey(name: 'unit_name')  String unitName, @JsonKey(name: 'conversion_factor')  double conversionFactor, @JsonKey(name: 'cost_price')  double costPrice, @JsonKey(name: 'selling_price')  double sellingPrice,  String? barcode, @JsonKey(name: 'is_base_unit')  bool isBaseUnit, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ProductUnit() when $default != null:
return $default(_that.id,_that.productId,_that.pharmacyId,_that.unitName,_that.conversionFactor,_that.costPrice,_that.sellingPrice,_that.barcode,_that.isBaseUnit,_that.updatedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductUnit implements ProductUnit {
  const _ProductUnit({required this.id, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'pharmacy_id') required this.pharmacyId, @JsonKey(name: 'unit_name') required this.unitName, @JsonKey(name: 'conversion_factor') this.conversionFactor = 1.0, @JsonKey(name: 'cost_price') this.costPrice = 0.0, @JsonKey(name: 'selling_price') required this.sellingPrice, this.barcode, @JsonKey(name: 'is_base_unit') this.isBaseUnit = false, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'created_at') this.createdAt});
  factory _ProductUnit.fromJson(Map<String, dynamic> json) => _$ProductUnitFromJson(json);

@override final  String id;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'pharmacy_id') final  String pharmacyId;
@override@JsonKey(name: 'unit_name') final  String unitName;
@override@JsonKey(name: 'conversion_factor') final  double conversionFactor;
@override@JsonKey(name: 'cost_price') final  double costPrice;
@override@JsonKey(name: 'selling_price') final  double sellingPrice;
@override final  String? barcode;
@override@JsonKey(name: 'is_base_unit') final  bool isBaseUnit;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of ProductUnit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductUnitCopyWith<_ProductUnit> get copyWith => __$ProductUnitCopyWithImpl<_ProductUnit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductUnitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductUnit&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.pharmacyId, pharmacyId) || other.pharmacyId == pharmacyId)&&(identical(other.unitName, unitName) || other.unitName == unitName)&&(identical(other.conversionFactor, conversionFactor) || other.conversionFactor == conversionFactor)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.isBaseUnit, isBaseUnit) || other.isBaseUnit == isBaseUnit)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,pharmacyId,unitName,conversionFactor,costPrice,sellingPrice,barcode,isBaseUnit,updatedAt,createdAt);

@override
String toString() {
  return 'ProductUnit(id: $id, productId: $productId, pharmacyId: $pharmacyId, unitName: $unitName, conversionFactor: $conversionFactor, costPrice: $costPrice, sellingPrice: $sellingPrice, barcode: $barcode, isBaseUnit: $isBaseUnit, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProductUnitCopyWith<$Res> implements $ProductUnitCopyWith<$Res> {
  factory _$ProductUnitCopyWith(_ProductUnit value, $Res Function(_ProductUnit) _then) = __$ProductUnitCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'pharmacy_id') String pharmacyId,@JsonKey(name: 'unit_name') String unitName,@JsonKey(name: 'conversion_factor') double conversionFactor,@JsonKey(name: 'cost_price') double costPrice,@JsonKey(name: 'selling_price') double sellingPrice, String? barcode,@JsonKey(name: 'is_base_unit') bool isBaseUnit,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$ProductUnitCopyWithImpl<$Res>
    implements _$ProductUnitCopyWith<$Res> {
  __$ProductUnitCopyWithImpl(this._self, this._then);

  final _ProductUnit _self;
  final $Res Function(_ProductUnit) _then;

/// Create a copy of ProductUnit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? pharmacyId = null,Object? unitName = null,Object? conversionFactor = null,Object? costPrice = null,Object? sellingPrice = null,Object? barcode = freezed,Object? isBaseUnit = null,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_ProductUnit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,pharmacyId: null == pharmacyId ? _self.pharmacyId : pharmacyId // ignore: cast_nullable_to_non_nullable
as String,unitName: null == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String,conversionFactor: null == conversionFactor ? _self.conversionFactor : conversionFactor // ignore: cast_nullable_to_non_nullable
as double,costPrice: null == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as double,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as double,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,isBaseUnit: null == isBaseUnit ? _self.isBaseUnit : isBaseUnit // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
