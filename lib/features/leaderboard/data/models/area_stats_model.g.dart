// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AreaStatsModel _$AreaStatsModelFromJson(Map<String, dynamic> json) =>
    _AreaStatsModel(
      submittedCount: (json['submittedCount'] as num).toInt(),
      resolvedCount: (json['resolvedCount'] as num).toInt(),
      avgResolveHours: (json['avgResolveHours'] as num).toDouble(),
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$AreaStatsModelToJson(_AreaStatsModel instance) =>
    <String, dynamic>{
      'submittedCount': instance.submittedCount,
      'resolvedCount': instance.resolvedCount,
      'avgResolveHours': instance.avgResolveHours,
      'score': instance.score,
    };
