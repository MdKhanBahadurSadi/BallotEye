// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncidentCommentModel _$IncidentCommentModelFromJson(
  Map<String, dynamic> json,
) => _IncidentCommentModel(
  id: json['id'] as String,
  userId: json['userId'] as String,
  userName: json['userName'] as String,
  text: json['text'] as String,
  timestamp: const TimestampConverter().fromJson(
    json['timestamp'] as Timestamp,
  ),
  sentiment: json['sentiment'] as String?,
);

Map<String, dynamic> _$IncidentCommentModelToJson(
  _IncidentCommentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'userName': instance.userName,
  'text': instance.text,
  'timestamp': const TimestampConverter().toJson(instance.timestamp),
  'sentiment': instance.sentiment,
};
