// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AreaStatsModel {

 int get submittedCount; int get resolvedCount; double get avgResolveHours; double get score;
/// Create a copy of AreaStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AreaStatsModelCopyWith<AreaStatsModel> get copyWith => _$AreaStatsModelCopyWithImpl<AreaStatsModel>(this as AreaStatsModel, _$identity);

  /// Serializes this AreaStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AreaStatsModel&&(identical(other.submittedCount, submittedCount) || other.submittedCount == submittedCount)&&(identical(other.resolvedCount, resolvedCount) || other.resolvedCount == resolvedCount)&&(identical(other.avgResolveHours, avgResolveHours) || other.avgResolveHours == avgResolveHours)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,submittedCount,resolvedCount,avgResolveHours,score);

@override
String toString() {
  return 'AreaStatsModel(submittedCount: $submittedCount, resolvedCount: $resolvedCount, avgResolveHours: $avgResolveHours, score: $score)';
}


}

/// @nodoc
abstract mixin class $AreaStatsModelCopyWith<$Res>  {
  factory $AreaStatsModelCopyWith(AreaStatsModel value, $Res Function(AreaStatsModel) _then) = _$AreaStatsModelCopyWithImpl;
@useResult
$Res call({
 int submittedCount, int resolvedCount, double avgResolveHours, double score
});




}
/// @nodoc
class _$AreaStatsModelCopyWithImpl<$Res>
    implements $AreaStatsModelCopyWith<$Res> {
  _$AreaStatsModelCopyWithImpl(this._self, this._then);

  final AreaStatsModel _self;
  final $Res Function(AreaStatsModel) _then;

/// Create a copy of AreaStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? submittedCount = null,Object? resolvedCount = null,Object? avgResolveHours = null,Object? score = null,}) {
  return _then(_self.copyWith(
submittedCount: null == submittedCount ? _self.submittedCount : submittedCount // ignore: cast_nullable_to_non_nullable
as int,resolvedCount: null == resolvedCount ? _self.resolvedCount : resolvedCount // ignore: cast_nullable_to_non_nullable
as int,avgResolveHours: null == avgResolveHours ? _self.avgResolveHours : avgResolveHours // ignore: cast_nullable_to_non_nullable
as double,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AreaStatsModel].
extension AreaStatsModelPatterns on AreaStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AreaStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AreaStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AreaStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _AreaStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AreaStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _AreaStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int submittedCount,  int resolvedCount,  double avgResolveHours,  double score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AreaStatsModel() when $default != null:
return $default(_that.submittedCount,_that.resolvedCount,_that.avgResolveHours,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int submittedCount,  int resolvedCount,  double avgResolveHours,  double score)  $default,) {final _that = this;
switch (_that) {
case _AreaStatsModel():
return $default(_that.submittedCount,_that.resolvedCount,_that.avgResolveHours,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int submittedCount,  int resolvedCount,  double avgResolveHours,  double score)?  $default,) {final _that = this;
switch (_that) {
case _AreaStatsModel() when $default != null:
return $default(_that.submittedCount,_that.resolvedCount,_that.avgResolveHours,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AreaStatsModel extends AreaStatsModel {
  const _AreaStatsModel({required this.submittedCount, required this.resolvedCount, required this.avgResolveHours, required this.score}): super._();
  factory _AreaStatsModel.fromJson(Map<String, dynamic> json) => _$AreaStatsModelFromJson(json);

@override final  int submittedCount;
@override final  int resolvedCount;
@override final  double avgResolveHours;
@override final  double score;

/// Create a copy of AreaStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AreaStatsModelCopyWith<_AreaStatsModel> get copyWith => __$AreaStatsModelCopyWithImpl<_AreaStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AreaStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AreaStatsModel&&(identical(other.submittedCount, submittedCount) || other.submittedCount == submittedCount)&&(identical(other.resolvedCount, resolvedCount) || other.resolvedCount == resolvedCount)&&(identical(other.avgResolveHours, avgResolveHours) || other.avgResolveHours == avgResolveHours)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,submittedCount,resolvedCount,avgResolveHours,score);

@override
String toString() {
  return 'AreaStatsModel(submittedCount: $submittedCount, resolvedCount: $resolvedCount, avgResolveHours: $avgResolveHours, score: $score)';
}


}

/// @nodoc
abstract mixin class _$AreaStatsModelCopyWith<$Res> implements $AreaStatsModelCopyWith<$Res> {
  factory _$AreaStatsModelCopyWith(_AreaStatsModel value, $Res Function(_AreaStatsModel) _then) = __$AreaStatsModelCopyWithImpl;
@override @useResult
$Res call({
 int submittedCount, int resolvedCount, double avgResolveHours, double score
});




}
/// @nodoc
class __$AreaStatsModelCopyWithImpl<$Res>
    implements _$AreaStatsModelCopyWith<$Res> {
  __$AreaStatsModelCopyWithImpl(this._self, this._then);

  final _AreaStatsModel _self;
  final $Res Function(_AreaStatsModel) _then;

/// Create a copy of AreaStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? submittedCount = null,Object? resolvedCount = null,Object? avgResolveHours = null,Object? score = null,}) {
  return _then(_AreaStatsModel(
submittedCount: null == submittedCount ? _self.submittedCount : submittedCount // ignore: cast_nullable_to_non_nullable
as int,resolvedCount: null == resolvedCount ? _self.resolvedCount : resolvedCount // ignore: cast_nullable_to_non_nullable
as int,avgResolveHours: null == avgResolveHours ? _self.avgResolveHours : avgResolveHours // ignore: cast_nullable_to_non_nullable
as double,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
