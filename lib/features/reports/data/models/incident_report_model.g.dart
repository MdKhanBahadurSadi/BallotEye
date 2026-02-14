// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncidentReportModel _$IncidentReportModelFromJson(Map<String, dynamic> json) =>
    _IncidentReportModel(
      id: json['id'] as String,
      observerId: json['observerId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      status: json['status'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      evidenceHash: json['evidenceHash'] as String?,
      mediaUrls: (json['mediaUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      timestamp: const TimestampConverter().fromJson(
        json['timestamp'] as Timestamp,
      ),
      priority: json['priority'] as String?,
      internalNote: json['internalNote'] as String?,
    );

Map<String, dynamic> _$IncidentReportModelToJson(
  _IncidentReportModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'observerId': instance.observerId,
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'status': instance.status,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'evidenceHash': instance.evidenceHash,
  'mediaUrls': instance.mediaUrls,
  'timestamp': const TimestampConverter().toJson(instance.timestamp),
  'priority': instance.priority,
  'internalNote': instance.internalNote,
};
