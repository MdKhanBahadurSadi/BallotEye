// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidentCommentModel {

 String get id; String get userId; String get userName; String get text;@TimestampConverter() DateTime get timestamp; String? get sentiment;
/// Create a copy of IncidentCommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentCommentModelCopyWith<IncidentCommentModel> get copyWith => _$IncidentCommentModelCopyWithImpl<IncidentCommentModel>(this as IncidentCommentModel, _$identity);

  /// Serializes this IncidentCommentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentCommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.text, text) || other.text == text)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.sentiment, sentiment) || other.sentiment == sentiment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userName,text,timestamp,sentiment);

@override
String toString() {
  return 'IncidentCommentModel(id: $id, userId: $userId, userName: $userName, text: $text, timestamp: $timestamp, sentiment: $sentiment)';
}


}

/// @nodoc
abstract mixin class $IncidentCommentModelCopyWith<$Res>  {
  factory $IncidentCommentModelCopyWith(IncidentCommentModel value, $Res Function(IncidentCommentModel) _then) = _$IncidentCommentModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String userName, String text,@TimestampConverter() DateTime timestamp, String? sentiment
});




}
/// @nodoc
class _$IncidentCommentModelCopyWithImpl<$Res>
    implements $IncidentCommentModelCopyWith<$Res> {
  _$IncidentCommentModelCopyWithImpl(this._self, this._then);

  final IncidentCommentModel _self;
  final $Res Function(IncidentCommentModel) _then;

/// Create a copy of IncidentCommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? userName = null,Object? text = null,Object? timestamp = null,Object? sentiment = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,sentiment: freezed == sentiment ? _self.sentiment : sentiment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidentCommentModel].
extension IncidentCommentModelPatterns on IncidentCommentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentCommentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentCommentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentCommentModel value)  $default,){
final _that = this;
switch (_that) {
case _IncidentCommentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentCommentModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentCommentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String userName,  String text, @TimestampConverter()  DateTime timestamp,  String? sentiment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentCommentModel() when $default != null:
return $default(_that.id,_that.userId,_that.userName,_that.text,_that.timestamp,_that.sentiment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String userName,  String text, @TimestampConverter()  DateTime timestamp,  String? sentiment)  $default,) {final _that = this;
switch (_that) {
case _IncidentCommentModel():
return $default(_that.id,_that.userId,_that.userName,_that.text,_that.timestamp,_that.sentiment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String userName,  String text, @TimestampConverter()  DateTime timestamp,  String? sentiment)?  $default,) {final _that = this;
switch (_that) {
case _IncidentCommentModel() when $default != null:
return $default(_that.id,_that.userId,_that.userName,_that.text,_that.timestamp,_that.sentiment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidentCommentModel extends IncidentCommentModel {
  const _IncidentCommentModel({required this.id, required this.userId, required this.userName, required this.text, @TimestampConverter() required this.timestamp, this.sentiment}): super._();
  factory _IncidentCommentModel.fromJson(Map<String, dynamic> json) => _$IncidentCommentModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String userName;
@override final  String text;
@override@TimestampConverter() final  DateTime timestamp;
@override final  String? sentiment;

/// Create a copy of IncidentCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentCommentModelCopyWith<_IncidentCommentModel> get copyWith => __$IncidentCommentModelCopyWithImpl<_IncidentCommentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentCommentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentCommentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.text, text) || other.text == text)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.sentiment, sentiment) || other.sentiment == sentiment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userName,text,timestamp,sentiment);

@override
String toString() {
  return 'IncidentCommentModel(id: $id, userId: $userId, userName: $userName, text: $text, timestamp: $timestamp, sentiment: $sentiment)';
}


}

/// @nodoc
abstract mixin class _$IncidentCommentModelCopyWith<$Res> implements $IncidentCommentModelCopyWith<$Res> {
  factory _$IncidentCommentModelCopyWith(_IncidentCommentModel value, $Res Function(_IncidentCommentModel) _then) = __$IncidentCommentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String userName, String text,@TimestampConverter() DateTime timestamp, String? sentiment
});




}
/// @nodoc
class __$IncidentCommentModelCopyWithImpl<$Res>
    implements _$IncidentCommentModelCopyWith<$Res> {
  __$IncidentCommentModelCopyWithImpl(this._self, this._then);

  final _IncidentCommentModel _self;
  final $Res Function(_IncidentCommentModel) _then;

/// Create a copy of IncidentCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? userName = null,Object? text = null,Object? timestamp = null,Object? sentiment = freezed,}) {
  return _then(_IncidentCommentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,sentiment: freezed == sentiment ? _self.sentiment : sentiment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
