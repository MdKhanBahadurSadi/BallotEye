// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'election_area_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ElectionAreaModel {

 String get id; String get name; String get code; AreaStatsModel get stats;
/// Create a copy of ElectionAreaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElectionAreaModelCopyWith<ElectionAreaModel> get copyWith => _$ElectionAreaModelCopyWithImpl<ElectionAreaModel>(this as ElectionAreaModel, _$identity);

  /// Serializes this ElectionAreaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ElectionAreaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,stats);

@override
String toString() {
  return 'ElectionAreaModel(id: $id, name: $name, code: $code, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $ElectionAreaModelCopyWith<$Res>  {
  factory $ElectionAreaModelCopyWith(ElectionAreaModel value, $Res Function(ElectionAreaModel) _then) = _$ElectionAreaModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, AreaStatsModel stats
});


$AreaStatsModelCopyWith<$Res> get stats;

}
/// @nodoc
class _$ElectionAreaModelCopyWithImpl<$Res>
    implements $ElectionAreaModelCopyWith<$Res> {
  _$ElectionAreaModelCopyWithImpl(this._self, this._then);

  final ElectionAreaModel _self;
  final $Res Function(ElectionAreaModel) _then;

/// Create a copy of ElectionAreaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? stats = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as AreaStatsModel,
  ));
}
/// Create a copy of ElectionAreaModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AreaStatsModelCopyWith<$Res> get stats {
  
  return $AreaStatsModelCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [ElectionAreaModel].
extension ElectionAreaModelPatterns on ElectionAreaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ElectionAreaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ElectionAreaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ElectionAreaModel value)  $default,){
final _that = this;
switch (_that) {
case _ElectionAreaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ElectionAreaModel value)?  $default,){
final _that = this;
switch (_that) {
case _ElectionAreaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  AreaStatsModel stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ElectionAreaModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  AreaStatsModel stats)  $default,) {final _that = this;
switch (_that) {
case _ElectionAreaModel():
return $default(_that.id,_that.name,_that.code,_that.stats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  AreaStatsModel stats)?  $default,) {final _that = this;
switch (_that) {
case _ElectionAreaModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.stats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ElectionAreaModel extends ElectionAreaModel {
  const _ElectionAreaModel({required this.id, required this.name, required this.code, required this.stats}): super._();
  factory _ElectionAreaModel.fromJson(Map<String, dynamic> json) => _$ElectionAreaModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String code;
@override final  AreaStatsModel stats;

/// Create a copy of ElectionAreaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElectionAreaModelCopyWith<_ElectionAreaModel> get copyWith => __$ElectionAreaModelCopyWithImpl<_ElectionAreaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ElectionAreaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ElectionAreaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,stats);

@override
String toString() {
  return 'ElectionAreaModel(id: $id, name: $name, code: $code, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$ElectionAreaModelCopyWith<$Res> implements $ElectionAreaModelCopyWith<$Res> {
  factory _$ElectionAreaModelCopyWith(_ElectionAreaModel value, $Res Function(_ElectionAreaModel) _then) = __$ElectionAreaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, AreaStatsModel stats
});


@override $AreaStatsModelCopyWith<$Res> get stats;

}
/// @nodoc
class __$ElectionAreaModelCopyWithImpl<$Res>
    implements _$ElectionAreaModelCopyWith<$Res> {
  __$ElectionAreaModelCopyWithImpl(this._self, this._then);

  final _ElectionAreaModel _self;
  final $Res Function(_ElectionAreaModel) _then;

/// Create a copy of ElectionAreaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? stats = null,}) {
  return _then(_ElectionAreaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as AreaStatsModel,
  ));
}

/// Create a copy of ElectionAreaModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AreaStatsModelCopyWith<$Res> get stats {
  
  return $AreaStatsModelCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

// dart format on
