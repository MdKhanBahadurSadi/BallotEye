// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monitoring_area_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonitoringAreaModel {

 String get id; String get name; String get type; Map<String, dynamic> get geoJson;
/// Create a copy of MonitoringAreaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonitoringAreaModelCopyWith<MonitoringAreaModel> get copyWith => _$MonitoringAreaModelCopyWithImpl<MonitoringAreaModel>(this as MonitoringAreaModel, _$identity);

  /// Serializes this MonitoringAreaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonitoringAreaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.geoJson, geoJson));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,const DeepCollectionEquality().hash(geoJson));

@override
String toString() {
  return 'MonitoringAreaModel(id: $id, name: $name, type: $type, geoJson: $geoJson)';
}


}

/// @nodoc
abstract mixin class $MonitoringAreaModelCopyWith<$Res>  {
  factory $MonitoringAreaModelCopyWith(MonitoringAreaModel value, $Res Function(MonitoringAreaModel) _then) = _$MonitoringAreaModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type, Map<String, dynamic> geoJson
});




}
/// @nodoc
class _$MonitoringAreaModelCopyWithImpl<$Res>
    implements $MonitoringAreaModelCopyWith<$Res> {
  _$MonitoringAreaModelCopyWithImpl(this._self, this._then);

  final MonitoringAreaModel _self;
  final $Res Function(MonitoringAreaModel) _then;

/// Create a copy of MonitoringAreaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? geoJson = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,geoJson: null == geoJson ? _self.geoJson : geoJson // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [MonitoringAreaModel].
extension MonitoringAreaModelPatterns on MonitoringAreaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonitoringAreaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonitoringAreaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonitoringAreaModel value)  $default,){
final _that = this;
switch (_that) {
case _MonitoringAreaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonitoringAreaModel value)?  $default,){
final _that = this;
switch (_that) {
case _MonitoringAreaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type,  Map<String, dynamic> geoJson)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonitoringAreaModel() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.geoJson);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type,  Map<String, dynamic> geoJson)  $default,) {final _that = this;
switch (_that) {
case _MonitoringAreaModel():
return $default(_that.id,_that.name,_that.type,_that.geoJson);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type,  Map<String, dynamic> geoJson)?  $default,) {final _that = this;
switch (_that) {
case _MonitoringAreaModel() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.geoJson);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MonitoringAreaModel extends MonitoringAreaModel {
  const _MonitoringAreaModel({required this.id, required this.name, required this.type, required final  Map<String, dynamic> geoJson}): _geoJson = geoJson,super._();
  factory _MonitoringAreaModel.fromJson(Map<String, dynamic> json) => _$MonitoringAreaModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;
 final  Map<String, dynamic> _geoJson;
@override Map<String, dynamic> get geoJson {
  if (_geoJson is EqualUnmodifiableMapView) return _geoJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_geoJson);
}


/// Create a copy of MonitoringAreaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonitoringAreaModelCopyWith<_MonitoringAreaModel> get copyWith => __$MonitoringAreaModelCopyWithImpl<_MonitoringAreaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonitoringAreaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonitoringAreaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._geoJson, _geoJson));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,const DeepCollectionEquality().hash(_geoJson));

@override
String toString() {
  return 'MonitoringAreaModel(id: $id, name: $name, type: $type, geoJson: $geoJson)';
}


}

/// @nodoc
abstract mixin class _$MonitoringAreaModelCopyWith<$Res> implements $MonitoringAreaModelCopyWith<$Res> {
  factory _$MonitoringAreaModelCopyWith(_MonitoringAreaModel value, $Res Function(_MonitoringAreaModel) _then) = __$MonitoringAreaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type, Map<String, dynamic> geoJson
});




}
/// @nodoc
class __$MonitoringAreaModelCopyWithImpl<$Res>
    implements _$MonitoringAreaModelCopyWith<$Res> {
  __$MonitoringAreaModelCopyWithImpl(this._self, this._then);

  final _MonitoringAreaModel _self;
  final $Res Function(_MonitoringAreaModel) _then;

/// Create a copy of MonitoringAreaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? geoJson = null,}) {
  return _then(_MonitoringAreaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,geoJson: null == geoJson ? _self._geoJson : geoJson // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
