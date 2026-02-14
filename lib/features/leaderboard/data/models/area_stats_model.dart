import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ballot_eye/features/leaderboard/domain/entities/area_stats.dart';

part 'area_stats_model.freezed.dart';
part 'area_stats_model.g.dart';

@freezed
abstract class AreaStatsModel with _$AreaStatsModel {
  const factory AreaStatsModel({
    required int submittedCount,
    required int resolvedCount,
    required double avgResolveHours,
    required double score,
  }) = _AreaStatsModel;

  factory AreaStatsModel.fromJson(Map<String, dynamic> json) => _$AreaStatsModelFromJson(json);

  factory AreaStatsModel.fromEntity(AreaStats stats) => AreaStatsModel(
        submittedCount: stats.submittedCount,
        resolvedCount: stats.resolvedCount,
        avgResolveHours: stats.avgResolveHours,
        score: stats.score,
      );

  const AreaStatsModel._();

  AreaStats toEntity() => AreaStats(
        submittedCount: submittedCount,
        resolvedCount: resolvedCount,
        avgResolveHours: avgResolveHours,
        score: score,
      );
}
