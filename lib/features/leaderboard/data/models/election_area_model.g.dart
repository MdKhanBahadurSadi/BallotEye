// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'election_area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ElectionAreaModel _$ElectionAreaModelFromJson(Map<String, dynamic> json) =>
    _ElectionAreaModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      stats: AreaStatsModel.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElectionAreaModelToJson(_ElectionAreaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'stats': instance.stats,
    };
