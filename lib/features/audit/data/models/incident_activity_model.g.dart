// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncidentActivityModel _$IncidentActivityModelFromJson(
  Map<String, dynamic> json,
) => _IncidentActivityModel(
  id: json['id'] as String,
  userId: json['userId'] as String,
  userName: json['userName'] as String,
  type: json['type'] as String,
  note: json['note'] as String,
  timestamp: const TimestampConverter().fromJson(
    json['timestamp'] as Timestamp,
  ),
);

Map<String, dynamic> _$IncidentActivityModelToJson(
  _IncidentActivityModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'userName': instance.userName,
  'type': instance.type,
  'note': instance.note,
  'timestamp': const TimestampConverter().toJson(instance.timestamp),
};
