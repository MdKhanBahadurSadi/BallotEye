// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring_area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonitoringAreaModel _$MonitoringAreaModelFromJson(Map<String, dynamic> json) =>
    _MonitoringAreaModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      geoJson: json['geoJson'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$MonitoringAreaModelToJson(
  _MonitoringAreaModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'geoJson': instance.geoJson,
};
