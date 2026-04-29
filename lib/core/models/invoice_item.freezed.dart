// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceItem {

 String get id;@JsonKey(name: 'invoice_id') String get invoiceId;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'batch_id') String get batchId; double get quantity;@JsonKey(name: 'unit_price') double get unitPrice;// New Pricing Fields
@JsonKey(name: 'original_unit_price') double? get originalUnitPrice;@JsonKey(name: 'applied_discount') double get appliedDiscount;@JsonKey(name: 'applied_premium') double get appliedPremium;@JsonKey(name: 'final_unit_price') double? get finalUnitPrice;@JsonKey(name: 'price_modified_by') String? get priceModifiedBy; double get subtotal;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of InvoiceItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceItemCopyWith<InvoiceItem> get copyWith => _$InvoiceItemCopyWithImpl<InvoiceItem>(this as InvoiceItem, _$identity);

  /// Serializes this InvoiceItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceItem&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceId, invoiceId) || other.invoiceId == invoiceId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.batchId, batchId) || other.batchId == batchId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.originalUnitPrice, originalUnitPrice) || other.originalUnitPrice == originalUnitPrice)&&(identical(other.appliedDiscount, appliedDiscount) || other.appliedDiscount == appliedDiscount)&&(identical(other.appliedPremium, appliedPremium) || other.appliedPremium == appliedPremium)&&(identical(other.finalUnitPrice, finalUnitPrice) || other.finalUnitPrice == finalUnitPrice)&&(identical(other.priceModifiedBy, priceModifiedBy) || other.priceModifiedBy == priceModifiedBy)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceId,productId,batchId,quantity,unitPrice,originalUnitPrice,appliedDiscount,appliedPremium,finalUnitPrice,priceModifiedBy,subtotal,updatedAt,createdAt);

@override
String toString() {
  return 'InvoiceItem(id: $id, invoiceId: $invoiceId, productId: $productId, batchId: $batchId, quantity: $quantity, unitPrice: $unitPrice, originalUnitPrice: $originalUnitPrice, appliedDiscount: $appliedDiscount, appliedPremium: $appliedPremium, finalUnitPrice: $finalUnitPrice, priceModifiedBy: $priceModifiedBy, subtotal: $subtotal, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $InvoiceItemCopyWith<$Res>  {
  factory $InvoiceItemCopyWith(InvoiceItem value, $Res Function(InvoiceItem) _then) = _$InvoiceItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'invoice_id') String invoiceId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'batch_id') String batchId, double quantity,@JsonKey(name: 'unit_price') double unitPrice,@JsonKey(name: 'original_unit_price') double? originalUnitPrice,@JsonKey(name: 'applied_discount') double appliedDiscount,@JsonKey(name: 'applied_premium') double appliedPremium,@JsonKey(name: 'final_unit_price') double? finalUnitPrice,@JsonKey(name: 'price_modified_by') String? priceModifiedBy, double subtotal,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$InvoiceItemCopyWithImpl<$Res>
    implements $InvoiceItemCopyWith<$Res> {
  _$InvoiceItemCopyWithImpl(this._self, this._then);

  final InvoiceItem _self;
  final $Res Function(InvoiceItem) _then;

/// Create a copy of InvoiceItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? invoiceId = null,Object? productId = null,Object? batchId = null,Object? quantity = null,Object? unitPrice = null,Object? originalUnitPrice = freezed,Object? appliedDiscount = null,Object? appliedPremium = null,Object? finalUnitPrice = freezed,Object? priceModifiedBy = freezed,Object? subtotal = null,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceId: null == invoiceId ? _self.invoiceId : invoiceId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,batchId: null == batchId ? _self.batchId : batchId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,originalUnitPrice: freezed == originalUnitPrice ? _self.originalUnitPrice : originalUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,appliedDiscount: null == appliedDiscount ? _self.appliedDiscount : appliedDiscount // ignore: cast_nullable_to_non_nullable
as double,appliedPremium: null == appliedPremium ? _self.appliedPremium : appliedPremium // ignore: cast_nullable_to_non_nullable
as double,finalUnitPrice: freezed == finalUnitPrice ? _self.finalUnitPrice : finalUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,priceModifiedBy: freezed == priceModifiedBy ? _self.priceModifiedBy : priceModifiedBy // ignore: cast_nullable_to_non_nullable
as String?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceItem].
extension InvoiceItemPatterns on InvoiceItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceItem value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceItem value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'invoice_id')  String invoiceId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'batch_id')  String batchId,  double quantity, @JsonKey(name: 'unit_price')  double unitPrice, @JsonKey(name: 'original_unit_price')  double? originalUnitPrice, @JsonKey(name: 'applied_discount')  double appliedDiscount, @JsonKey(name: 'applied_premium')  double appliedPremium, @JsonKey(name: 'final_unit_price')  double? finalUnitPrice, @JsonKey(name: 'price_modified_by')  String? priceModifiedBy,  double subtotal, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceItem() when $default != null:
return $default(_that.id,_that.invoiceId,_that.productId,_that.batchId,_that.quantity,_that.unitPrice,_that.originalUnitPrice,_that.appliedDiscount,_that.appliedPremium,_that.finalUnitPrice,_that.priceModifiedBy,_that.subtotal,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'invoice_id')  String invoiceId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'batch_id')  String batchId,  double quantity, @JsonKey(name: 'unit_price')  double unitPrice, @JsonKey(name: 'original_unit_price')  double? originalUnitPrice, @JsonKey(name: 'applied_discount')  double appliedDiscount, @JsonKey(name: 'applied_premium')  double appliedPremium, @JsonKey(name: 'final_unit_price')  double? finalUnitPrice, @JsonKey(name: 'price_modified_by')  String? priceModifiedBy,  double subtotal, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _InvoiceItem():
return $default(_that.id,_that.invoiceId,_that.productId,_that.batchId,_that.quantity,_that.unitPrice,_that.originalUnitPrice,_that.appliedDiscount,_that.appliedPremium,_that.finalUnitPrice,_that.priceModifiedBy,_that.subtotal,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'invoice_id')  String invoiceId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'batch_id')  String batchId,  double quantity, @JsonKey(name: 'unit_price')  double unitPrice, @JsonKey(name: 'original_unit_price')  double? originalUnitPrice, @JsonKey(name: 'applied_discount')  double appliedDiscount, @JsonKey(name: 'applied_premium')  double appliedPremium, @JsonKey(name: 'final_unit_price')  double? finalUnitPrice, @JsonKey(name: 'price_modified_by')  String? priceModifiedBy,  double subtotal, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceItem() when $default != null:
return $default(_that.id,_that.invoiceId,_that.productId,_that.batchId,_that.quantity,_that.unitPrice,_that.originalUnitPrice,_that.appliedDiscount,_that.appliedPremium,_that.finalUnitPrice,_that.priceModifiedBy,_that.subtotal,_that.updatedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceItem implements InvoiceItem {
  const _InvoiceItem({required this.id, @JsonKey(name: 'invoice_id') required this.invoiceId, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'batch_id') required this.batchId, required this.quantity, @JsonKey(name: 'unit_price') required this.unitPrice, @JsonKey(name: 'original_unit_price') this.originalUnitPrice, @JsonKey(name: 'applied_discount') this.appliedDiscount = 0.0, @JsonKey(name: 'applied_premium') this.appliedPremium = 0.0, @JsonKey(name: 'final_unit_price') this.finalUnitPrice, @JsonKey(name: 'price_modified_by') this.priceModifiedBy, required this.subtotal, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'created_at') this.createdAt});
  factory _InvoiceItem.fromJson(Map<String, dynamic> json) => _$InvoiceItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'invoice_id') final  String invoiceId;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'batch_id') final  String batchId;
@override final  double quantity;
@override@JsonKey(name: 'unit_price') final  double unitPrice;
// New Pricing Fields
@override@JsonKey(name: 'original_unit_price') final  double? originalUnitPrice;
@override@JsonKey(name: 'applied_discount') final  double appliedDiscount;
@override@JsonKey(name: 'applied_premium') final  double appliedPremium;
@override@JsonKey(name: 'final_unit_price') final  double? finalUnitPrice;
@override@JsonKey(name: 'price_modified_by') final  String? priceModifiedBy;
@override final  double subtotal;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of InvoiceItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceItemCopyWith<_InvoiceItem> get copyWith => __$InvoiceItemCopyWithImpl<_InvoiceItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceItem&&(identical(other.id, id) || other.id == id)&&(identical(other.invoiceId, invoiceId) || other.invoiceId == invoiceId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.batchId, batchId) || other.batchId == batchId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.originalUnitPrice, originalUnitPrice) || other.originalUnitPrice == originalUnitPrice)&&(identical(other.appliedDiscount, appliedDiscount) || other.appliedDiscount == appliedDiscount)&&(identical(other.appliedPremium, appliedPremium) || other.appliedPremium == appliedPremium)&&(identical(other.finalUnitPrice, finalUnitPrice) || other.finalUnitPrice == finalUnitPrice)&&(identical(other.priceModifiedBy, priceModifiedBy) || other.priceModifiedBy == priceModifiedBy)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,invoiceId,productId,batchId,quantity,unitPrice,originalUnitPrice,appliedDiscount,appliedPremium,finalUnitPrice,priceModifiedBy,subtotal,updatedAt,createdAt);

@override
String toString() {
  return 'InvoiceItem(id: $id, invoiceId: $invoiceId, productId: $productId, batchId: $batchId, quantity: $quantity, unitPrice: $unitPrice, originalUnitPrice: $originalUnitPrice, appliedDiscount: $appliedDiscount, appliedPremium: $appliedPremium, finalUnitPrice: $finalUnitPrice, priceModifiedBy: $priceModifiedBy, subtotal: $subtotal, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$InvoiceItemCopyWith<$Res> implements $InvoiceItemCopyWith<$Res> {
  factory _$InvoiceItemCopyWith(_InvoiceItem value, $Res Function(_InvoiceItem) _then) = __$InvoiceItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'invoice_id') String invoiceId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'batch_id') String batchId, double quantity,@JsonKey(name: 'unit_price') double unitPrice,@JsonKey(name: 'original_unit_price') double? originalUnitPrice,@JsonKey(name: 'applied_discount') double appliedDiscount,@JsonKey(name: 'applied_premium') double appliedPremium,@JsonKey(name: 'final_unit_price') double? finalUnitPrice,@JsonKey(name: 'price_modified_by') String? priceModifiedBy, double subtotal,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$InvoiceItemCopyWithImpl<$Res>
    implements _$InvoiceItemCopyWith<$Res> {
  __$InvoiceItemCopyWithImpl(this._self, this._then);

  final _InvoiceItem _self;
  final $Res Function(_InvoiceItem) _then;

/// Create a copy of InvoiceItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? invoiceId = null,Object? productId = null,Object? batchId = null,Object? quantity = null,Object? unitPrice = null,Object? originalUnitPrice = freezed,Object? appliedDiscount = null,Object? appliedPremium = null,Object? finalUnitPrice = freezed,Object? priceModifiedBy = freezed,Object? subtotal = null,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_InvoiceItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,invoiceId: null == invoiceId ? _self.invoiceId : invoiceId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,batchId: null == batchId ? _self.batchId : batchId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,originalUnitPrice: freezed == originalUnitPrice ? _self.originalUnitPrice : originalUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,appliedDiscount: null == appliedDiscount ? _self.appliedDiscount : appliedDiscount // ignore: cast_nullable_to_non_nullable
as double,appliedPremium: null == appliedPremium ? _self.appliedPremium : appliedPremium // ignore: cast_nullable_to_non_nullable
as double,finalUnitPrice: freezed == finalUnitPrice ? _self.finalUnitPrice : finalUnitPrice // ignore: cast_nullable_to_non_nullable
as double?,priceModifiedBy: freezed == priceModifiedBy ? _self.priceModifiedBy : priceModifiedBy // ignore: cast_nullable_to_non_nullable
as String?,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
