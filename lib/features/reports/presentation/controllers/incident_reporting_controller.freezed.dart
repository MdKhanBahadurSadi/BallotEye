// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_reporting_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IncidentReportingState {

 bool get isSubmitting; List<File> get mediaFiles; double? get latitude; double? get longitude; String? get error;
/// Create a copy of IncidentReportingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentReportingStateCopyWith<IncidentReportingState> get copyWith => _$IncidentReportingStateCopyWithImpl<IncidentReportingState>(this as IncidentReportingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentReportingState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other.mediaFiles, mediaFiles)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,const DeepCollectionEquality().hash(mediaFiles),latitude,longitude,error);

@override
String toString() {
  return 'IncidentReportingState(isSubmitting: $isSubmitting, mediaFiles: $mediaFiles, latitude: $latitude, longitude: $longitude, error: $error)';
}


}

/// @nodoc
abstract mixin class $IncidentReportingStateCopyWith<$Res>  {
  factory $IncidentReportingStateCopyWith(IncidentReportingState value, $Res Function(IncidentReportingState) _then) = _$IncidentReportingStateCopyWithImpl;
@useResult
$Res call({
 bool isSubmitting, List<File> mediaFiles, double? latitude, double? longitude, String? error
});




}
/// @nodoc
class _$IncidentReportingStateCopyWithImpl<$Res>
    implements $IncidentReportingStateCopyWith<$Res> {
  _$IncidentReportingStateCopyWithImpl(this._self, this._then);

  final IncidentReportingState _self;
  final $Res Function(IncidentReportingState) _then;

/// Create a copy of IncidentReportingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSubmitting = null,Object? mediaFiles = null,Object? latitude = freezed,Object? longitude = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,mediaFiles: null == mediaFiles ? _self.mediaFiles : mediaFiles // ignore: cast_nullable_to_non_nullable
as List<File>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidentReportingState].
extension IncidentReportingStatePatterns on IncidentReportingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentReportingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentReportingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentReportingState value)  $default,){
final _that = this;
switch (_that) {
case _IncidentReportingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentReportingState value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentReportingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSubmitting,  List<File> mediaFiles,  double? latitude,  double? longitude,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentReportingState() when $default != null:
return $default(_that.isSubmitting,_that.mediaFiles,_that.latitude,_that.longitude,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSubmitting,  List<File> mediaFiles,  double? latitude,  double? longitude,  String? error)  $default,) {final _that = this;
switch (_that) {
case _IncidentReportingState():
return $default(_that.isSubmitting,_that.mediaFiles,_that.latitude,_that.longitude,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSubmitting,  List<File> mediaFiles,  double? latitude,  double? longitude,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _IncidentReportingState() when $default != null:
return $default(_that.isSubmitting,_that.mediaFiles,_that.latitude,_that.longitude,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _IncidentReportingState implements IncidentReportingState {
  const _IncidentReportingState({this.isSubmitting = false, final  List<File> mediaFiles = const [], this.latitude, this.longitude, this.error}): _mediaFiles = mediaFiles;
  

@override@JsonKey() final  bool isSubmitting;
 final  List<File> _mediaFiles;
@override@JsonKey() List<File> get mediaFiles {
  if (_mediaFiles is EqualUnmodifiableListView) return _mediaFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaFiles);
}

@override final  double? latitude;
@override final  double? longitude;
@override final  String? error;

/// Create a copy of IncidentReportingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentReportingStateCopyWith<_IncidentReportingState> get copyWith => __$IncidentReportingStateCopyWithImpl<_IncidentReportingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentReportingState&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&const DeepCollectionEquality().equals(other._mediaFiles, _mediaFiles)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isSubmitting,const DeepCollectionEquality().hash(_mediaFiles),latitude,longitude,error);

@override
String toString() {
  return 'IncidentReportingState(isSubmitting: $isSubmitting, mediaFiles: $mediaFiles, latitude: $latitude, longitude: $longitude, error: $error)';
}


}

/// @nodoc
abstract mixin class _$IncidentReportingStateCopyWith<$Res> implements $IncidentReportingStateCopyWith<$Res> {
  factory _$IncidentReportingStateCopyWith(_IncidentReportingState value, $Res Function(_IncidentReportingState) _then) = __$IncidentReportingStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSubmitting, List<File> mediaFiles, double? latitude, double? longitude, String? error
});




}
/// @nodoc
class __$IncidentReportingStateCopyWithImpl<$Res>
    implements _$IncidentReportingStateCopyWith<$Res> {
  __$IncidentReportingStateCopyWithImpl(this._self, this._then);

  final _IncidentReportingState _self;
  final $Res Function(_IncidentReportingState) _then;

/// Create a copy of IncidentReportingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSubmitting = null,Object? mediaFiles = null,Object? latitude = freezed,Object? longitude = freezed,Object? error = freezed,}) {
  return _then(_IncidentReportingState(
isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,mediaFiles: null == mediaFiles ? _self._mediaFiles : mediaFiles // ignore: cast_nullable_to_non_nullable
as List<File>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
