// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidentReportModel {

 String get id; String get observerId; String get title; String get description; String get category; String get status; double get latitude; double get longitude; String? get evidenceHash; List<String> get mediaUrls;@TimestampConverter() DateTime get timestamp; String? get priority; String? get internalNote;
/// Create a copy of IncidentReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentReportModelCopyWith<IncidentReportModel> get copyWith => _$IncidentReportModelCopyWithImpl<IncidentReportModel>(this as IncidentReportModel, _$identity);

  /// Serializes this IncidentReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.observerId, observerId) || other.observerId == observerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.evidenceHash, evidenceHash) || other.evidenceHash == evidenceHash)&&const DeepCollectionEquality().equals(other.mediaUrls, mediaUrls)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.internalNote, internalNote) || other.internalNote == internalNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,observerId,title,description,category,status,latitude,longitude,evidenceHash,const DeepCollectionEquality().hash(mediaUrls),timestamp,priority,internalNote);

@override
String toString() {
  return 'IncidentReportModel(id: $id, observerId: $observerId, title: $title, description: $description, category: $category, status: $status, latitude: $latitude, longitude: $longitude, evidenceHash: $evidenceHash, mediaUrls: $mediaUrls, timestamp: $timestamp, priority: $priority, internalNote: $internalNote)';
}


}

/// @nodoc
abstract mixin class $IncidentReportModelCopyWith<$Res>  {
  factory $IncidentReportModelCopyWith(IncidentReportModel value, $Res Function(IncidentReportModel) _then) = _$IncidentReportModelCopyWithImpl;
@useResult
$Res call({
 String id, String observerId, String title, String description, String category, String status, double latitude, double longitude, String? evidenceHash, List<String> mediaUrls,@TimestampConverter() DateTime timestamp, String? priority, String? internalNote
});




}
/// @nodoc
class _$IncidentReportModelCopyWithImpl<$Res>
    implements $IncidentReportModelCopyWith<$Res> {
  _$IncidentReportModelCopyWithImpl(this._self, this._then);

  final IncidentReportModel _self;
  final $Res Function(IncidentReportModel) _then;

/// Create a copy of IncidentReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? observerId = null,Object? title = null,Object? description = null,Object? category = null,Object? status = null,Object? latitude = null,Object? longitude = null,Object? evidenceHash = freezed,Object? mediaUrls = null,Object? timestamp = null,Object? priority = freezed,Object? internalNote = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,observerId: null == observerId ? _self.observerId : observerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,evidenceHash: freezed == evidenceHash ? _self.evidenceHash : evidenceHash // ignore: cast_nullable_to_non_nullable
as String?,mediaUrls: null == mediaUrls ? _self.mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String?,internalNote: freezed == internalNote ? _self.internalNote : internalNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidentReportModel].
extension IncidentReportModelPatterns on IncidentReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentReportModel value)  $default,){
final _that = this;
switch (_that) {
case _IncidentReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String observerId,  String title,  String description,  String category,  String status,  double latitude,  double longitude,  String? evidenceHash,  List<String> mediaUrls, @TimestampConverter()  DateTime timestamp,  String? priority,  String? internalNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentReportModel() when $default != null:
return $default(_that.id,_that.observerId,_that.title,_that.description,_that.category,_that.status,_that.latitude,_that.longitude,_that.evidenceHash,_that.mediaUrls,_that.timestamp,_that.priority,_that.internalNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String observerId,  String title,  String description,  String category,  String status,  double latitude,  double longitude,  String? evidenceHash,  List<String> mediaUrls, @TimestampConverter()  DateTime timestamp,  String? priority,  String? internalNote)  $default,) {final _that = this;
switch (_that) {
case _IncidentReportModel():
return $default(_that.id,_that.observerId,_that.title,_that.description,_that.category,_that.status,_that.latitude,_that.longitude,_that.evidenceHash,_that.mediaUrls,_that.timestamp,_that.priority,_that.internalNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String observerId,  String title,  String description,  String category,  String status,  double latitude,  double longitude,  String? evidenceHash,  List<String> mediaUrls, @TimestampConverter()  DateTime timestamp,  String? priority,  String? internalNote)?  $default,) {final _that = this;
switch (_that) {
case _IncidentReportModel() when $default != null:
return $default(_that.id,_that.observerId,_that.title,_that.description,_that.category,_that.status,_that.latitude,_that.longitude,_that.evidenceHash,_that.mediaUrls,_that.timestamp,_that.priority,_that.internalNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidentReportModel extends IncidentReportModel {
  const _IncidentReportModel({required this.id, required this.observerId, required this.title, required this.description, required this.category, required this.status, required this.latitude, required this.longitude, this.evidenceHash, required final  List<String> mediaUrls, @TimestampConverter() required this.timestamp, this.priority, this.internalNote}): _mediaUrls = mediaUrls,super._();
  factory _IncidentReportModel.fromJson(Map<String, dynamic> json) => _$IncidentReportModelFromJson(json);

@override final  String id;
@override final  String observerId;
@override final  String title;
@override final  String description;
@override final  String category;
@override final  String status;
@override final  double latitude;
@override final  double longitude;
@override final  String? evidenceHash;
 final  List<String> _mediaUrls;
@override List<String> get mediaUrls {
  if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaUrls);
}

@override@TimestampConverter() final  DateTime timestamp;
@override final  String? priority;
@override final  String? internalNote;

/// Create a copy of IncidentReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentReportModelCopyWith<_IncidentReportModel> get copyWith => __$IncidentReportModelCopyWithImpl<_IncidentReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.observerId, observerId) || other.observerId == observerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.evidenceHash, evidenceHash) || other.evidenceHash == evidenceHash)&&const DeepCollectionEquality().equals(other._mediaUrls, _mediaUrls)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.internalNote, internalNote) || other.internalNote == internalNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,observerId,title,description,category,status,latitude,longitude,evidenceHash,const DeepCollectionEquality().hash(_mediaUrls),timestamp,priority,internalNote);

@override
String toString() {
  return 'IncidentReportModel(id: $id, observerId: $observerId, title: $title, description: $description, category: $category, status: $status, latitude: $latitude, longitude: $longitude, evidenceHash: $evidenceHash, mediaUrls: $mediaUrls, timestamp: $timestamp, priority: $priority, internalNote: $internalNote)';
}


}

/// @nodoc
abstract mixin class _$IncidentReportModelCopyWith<$Res> implements $IncidentReportModelCopyWith<$Res> {
  factory _$IncidentReportModelCopyWith(_IncidentReportModel value, $Res Function(_IncidentReportModel) _then) = __$IncidentReportModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String observerId, String title, String description, String category, String status, double latitude, double longitude, String? evidenceHash, List<String> mediaUrls,@TimestampConverter() DateTime timestamp, String? priority, String? internalNote
});




}
/// @nodoc
class __$IncidentReportModelCopyWithImpl<$Res>
    implements _$IncidentReportModelCopyWith<$Res> {
  __$IncidentReportModelCopyWithImpl(this._self, this._then);

  final _IncidentReportModel _self;
  final $Res Function(_IncidentReportModel) _then;

/// Create a copy of IncidentReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? observerId = null,Object? title = null,Object? description = null,Object? category = null,Object? status = null,Object? latitude = null,Object? longitude = null,Object? evidenceHash = freezed,Object? mediaUrls = null,Object? timestamp = null,Object? priority = freezed,Object? internalNote = freezed,}) {
  return _then(_IncidentReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,observerId: null == observerId ? _self.observerId : observerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,evidenceHash: freezed == evidenceHash ? _self.evidenceHash : evidenceHash // ignore: cast_nullable_to_non_nullable
as String?,mediaUrls: null == mediaUrls ? _self._mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String?,internalNote: freezed == internalNote ? _self.internalNote : internalNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
