// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_drug.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MasterDrug {

 String get id; String? get barcode;@JsonKey(name: 'trade_name') String get tradeName;@JsonKey(name: 'scientific_name') String? get scientificName; String? get manufacturer; String? get form;@JsonKey(name: 'is_verified') bool get isVerified;@JsonKey(name: 'origin_pharmacy_id') String? get originPharmacyId;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of MasterDrug
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MasterDrugCopyWith<MasterDrug> get copyWith => _$MasterDrugCopyWithImpl<MasterDrug>(this as MasterDrug, _$identity);

  /// Serializes this MasterDrug to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MasterDrug&&(identical(other.id, id) || other.id == id)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.tradeName, tradeName) || other.tradeName == tradeName)&&(identical(other.scientificName, scientificName) || other.scientificName == scientificName)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.form, form) || other.form == form)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.originPharmacyId, originPharmacyId) || other.originPharmacyId == originPharmacyId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,barcode,tradeName,scientificName,manufacturer,form,isVerified,originPharmacyId,updatedAt,createdAt);

@override
String toString() {
  return 'MasterDrug(id: $id, barcode: $barcode, tradeName: $tradeName, scientificName: $scientificName, manufacturer: $manufacturer, form: $form, isVerified: $isVerified, originPharmacyId: $originPharmacyId, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MasterDrugCopyWith<$Res>  {
  factory $MasterDrugCopyWith(MasterDrug value, $Res Function(MasterDrug) _then) = _$MasterDrugCopyWithImpl;
@useResult
$Res call({
 String id, String? barcode,@JsonKey(name: 'trade_name') String tradeName,@JsonKey(name: 'scientific_name') String? scientificName, String? manufacturer, String? form,@JsonKey(name: 'is_verified') bool isVerified,@JsonKey(name: 'origin_pharmacy_id') String? originPharmacyId,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$MasterDrugCopyWithImpl<$Res>
    implements $MasterDrugCopyWith<$Res> {
  _$MasterDrugCopyWithImpl(this._self, this._then);

  final MasterDrug _self;
  final $Res Function(MasterDrug) _then;

/// Create a copy of MasterDrug
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? barcode = freezed,Object? tradeName = null,Object? scientificName = freezed,Object? manufacturer = freezed,Object? form = freezed,Object? isVerified = null,Object? originPharmacyId = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,tradeName: null == tradeName ? _self.tradeName : tradeName // ignore: cast_nullable_to_non_nullable
as String,scientificName: freezed == scientificName ? _self.scientificName : scientificName // ignore: cast_nullable_to_non_nullable
as String?,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String?,form: freezed == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,originPharmacyId: freezed == originPharmacyId ? _self.originPharmacyId : originPharmacyId // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MasterDrug].
extension MasterDrugPatterns on MasterDrug {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MasterDrug value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MasterDrug() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MasterDrug value)  $default,){
final _that = this;
switch (_that) {
case _MasterDrug():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MasterDrug value)?  $default,){
final _that = this;
switch (_that) {
case _MasterDrug() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? barcode, @JsonKey(name: 'trade_name')  String tradeName, @JsonKey(name: 'scientific_name')  String? scientificName,  String? manufacturer,  String? form, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'origin_pharmacy_id')  String? originPharmacyId, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MasterDrug() when $default != null:
return $default(_that.id,_that.barcode,_that.tradeName,_that.scientificName,_that.manufacturer,_that.form,_that.isVerified,_that.originPharmacyId,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? barcode, @JsonKey(name: 'trade_name')  String tradeName, @JsonKey(name: 'scientific_name')  String? scientificName,  String? manufacturer,  String? form, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'origin_pharmacy_id')  String? originPharmacyId, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _MasterDrug():
return $default(_that.id,_that.barcode,_that.tradeName,_that.scientificName,_that.manufacturer,_that.form,_that.isVerified,_that.originPharmacyId,_that.updatedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? barcode, @JsonKey(name: 'trade_name')  String tradeName, @JsonKey(name: 'scientific_name')  String? scientificName,  String? manufacturer,  String? form, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'origin_pharmacy_id')  String? originPharmacyId, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MasterDrug() when $default != null:
return $default(_that.id,_that.barcode,_that.tradeName,_that.scientificName,_that.manufacturer,_that.form,_that.isVerified,_that.originPharmacyId,_that.updatedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MasterDrug implements MasterDrug {
  const _MasterDrug({required this.id, this.barcode, @JsonKey(name: 'trade_name') required this.tradeName, @JsonKey(name: 'scientific_name') this.scientificName, this.manufacturer, this.form, @JsonKey(name: 'is_verified') this.isVerified = false, @JsonKey(name: 'origin_pharmacy_id') this.originPharmacyId, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'created_at') this.createdAt});
  factory _MasterDrug.fromJson(Map<String, dynamic> json) => _$MasterDrugFromJson(json);

@override final  String id;
@override final  String? barcode;
@override@JsonKey(name: 'trade_name') final  String tradeName;
@override@JsonKey(name: 'scientific_name') final  String? scientificName;
@override final  String? manufacturer;
@override final  String? form;
@override@JsonKey(name: 'is_verified') final  bool isVerified;
@override@JsonKey(name: 'origin_pharmacy_id') final  String? originPharmacyId;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of MasterDrug
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MasterDrugCopyWith<_MasterDrug> get copyWith => __$MasterDrugCopyWithImpl<_MasterDrug>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MasterDrugToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MasterDrug&&(identical(other.id, id) || other.id == id)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.tradeName, tradeName) || other.tradeName == tradeName)&&(identical(other.scientificName, scientificName) || other.scientificName == scientificName)&&(identical(other.manufacturer, manufacturer) || other.manufacturer == manufacturer)&&(identical(other.form, form) || other.form == form)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.originPharmacyId, originPharmacyId) || other.originPharmacyId == originPharmacyId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,barcode,tradeName,scientificName,manufacturer,form,isVerified,originPharmacyId,updatedAt,createdAt);

@override
String toString() {
  return 'MasterDrug(id: $id, barcode: $barcode, tradeName: $tradeName, scientificName: $scientificName, manufacturer: $manufacturer, form: $form, isVerified: $isVerified, originPharmacyId: $originPharmacyId, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MasterDrugCopyWith<$Res> implements $MasterDrugCopyWith<$Res> {
  factory _$MasterDrugCopyWith(_MasterDrug value, $Res Function(_MasterDrug) _then) = __$MasterDrugCopyWithImpl;
@override @useResult
$Res call({
 String id, String? barcode,@JsonKey(name: 'trade_name') String tradeName,@JsonKey(name: 'scientific_name') String? scientificName, String? manufacturer, String? form,@JsonKey(name: 'is_verified') bool isVerified,@JsonKey(name: 'origin_pharmacy_id') String? originPharmacyId,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$MasterDrugCopyWithImpl<$Res>
    implements _$MasterDrugCopyWith<$Res> {
  __$MasterDrugCopyWithImpl(this._self, this._then);

  final _MasterDrug _self;
  final $Res Function(_MasterDrug) _then;

/// Create a copy of MasterDrug
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? barcode = freezed,Object? tradeName = null,Object? scientificName = freezed,Object? manufacturer = freezed,Object? form = freezed,Object? isVerified = null,Object? originPharmacyId = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_MasterDrug(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,tradeName: null == tradeName ? _self.tradeName : tradeName // ignore: cast_nullable_to_non_nullable
as String,scientificName: freezed == scientificName ? _self.scientificName : scientificName // ignore: cast_nullable_to_non_nullable
as String?,manufacturer: freezed == manufacturer ? _self.manufacturer : manufacturer // ignore: cast_nullable_to_non_nullable
as String?,form: freezed == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,originPharmacyId: freezed == originPharmacyId ? _self.originPharmacyId : originPharmacyId // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
