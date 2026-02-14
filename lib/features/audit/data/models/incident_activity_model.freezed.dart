// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidentActivityModel {

 String get id; String get userId; String get userName; String get type; String get note;@TimestampConverter() DateTime get timestamp;
/// Create a copy of IncidentActivityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentActivityModelCopyWith<IncidentActivityModel> get copyWith => _$IncidentActivityModelCopyWithImpl<IncidentActivityModel>(this as IncidentActivityModel, _$identity);

  /// Serializes this IncidentActivityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentActivityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.type, type) || other.type == type)&&(identical(other.note, note) || other.note == note)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userName,type,note,timestamp);

@override
String toString() {
  return 'IncidentActivityModel(id: $id, userId: $userId, userName: $userName, type: $type, note: $note, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $IncidentActivityModelCopyWith<$Res>  {
  factory $IncidentActivityModelCopyWith(IncidentActivityModel value, $Res Function(IncidentActivityModel) _then) = _$IncidentActivityModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String userName, String type, String note,@TimestampConverter() DateTime timestamp
});




}
/// @nodoc
class _$IncidentActivityModelCopyWithImpl<$Res>
    implements $IncidentActivityModelCopyWith<$Res> {
  _$IncidentActivityModelCopyWithImpl(this._self, this._then);

  final IncidentActivityModel _self;
  final $Res Function(IncidentActivityModel) _then;

/// Create a copy of IncidentActivityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? userName = null,Object? type = null,Object? note = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidentActivityModel].
extension IncidentActivityModelPatterns on IncidentActivityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentActivityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentActivityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentActivityModel value)  $default,){
final _that = this;
switch (_that) {
case _IncidentActivityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentActivityModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentActivityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String userName,  String type,  String note, @TimestampConverter()  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentActivityModel() when $default != null:
return $default(_that.id,_that.userId,_that.userName,_that.type,_that.note,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String userName,  String type,  String note, @TimestampConverter()  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _IncidentActivityModel():
return $default(_that.id,_that.userId,_that.userName,_that.type,_that.note,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String userName,  String type,  String note, @TimestampConverter()  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _IncidentActivityModel() when $default != null:
return $default(_that.id,_that.userId,_that.userName,_that.type,_that.note,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidentActivityModel extends IncidentActivityModel {
  const _IncidentActivityModel({required this.id, required this.userId, required this.userName, required this.type, required this.note, @TimestampConverter() required this.timestamp}): super._();
  factory _IncidentActivityModel.fromJson(Map<String, dynamic> json) => _$IncidentActivityModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String userName;
@override final  String type;
@override final  String note;
@override@TimestampConverter() final  DateTime timestamp;

/// Create a copy of IncidentActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentActivityModelCopyWith<_IncidentActivityModel> get copyWith => __$IncidentActivityModelCopyWithImpl<_IncidentActivityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentActivityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentActivityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.type, type) || other.type == type)&&(identical(other.note, note) || other.note == note)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userName,type,note,timestamp);

@override
String toString() {
  return 'IncidentActivityModel(id: $id, userId: $userId, userName: $userName, type: $type, note: $note, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$IncidentActivityModelCopyWith<$Res> implements $IncidentActivityModelCopyWith<$Res> {
  factory _$IncidentActivityModelCopyWith(_IncidentActivityModel value, $Res Function(_IncidentActivityModel) _then) = __$IncidentActivityModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String userName, String type, String note,@TimestampConverter() DateTime timestamp
});




}
/// @nodoc
class __$IncidentActivityModelCopyWithImpl<$Res>
    implements _$IncidentActivityModelCopyWith<$Res> {
  __$IncidentActivityModelCopyWithImpl(this._self, this._then);

  final _IncidentActivityModel _self;
  final $Res Function(_IncidentActivityModel) _then;

/// Create a copy of IncidentActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? userName = null,Object? type = null,Object? note = null,Object? timestamp = null,}) {
  return _then(_IncidentActivityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
