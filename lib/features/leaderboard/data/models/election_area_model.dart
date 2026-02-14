import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ballot_eye/features/leaderboard/domain/entities/election_area.dart';
import 'package:ballot_eye/features/leaderboard/data/models/area_stats_model.dart';

part 'election_area_model.freezed.dart';
part 'election_area_model.g.dart';

@freezed
abstract class ElectionAreaModel with _$ElectionAreaModel {
  const factory ElectionAreaModel({
    required String id,
    required String name,
    required String code,
    required AreaStatsModel stats,
  }) = _ElectionAreaModel;

  factory ElectionAreaModel.fromJson(Map<String, dynamic> json) => _$ElectionAreaModelFromJson(json);

  factory ElectionAreaModel.fromEntity(ElectionArea area) => ElectionAreaModel(
        id: area.id,
        name: area.name,
        code: area.code,
        stats: AreaStatsModel.fromEntity(area.stats),
      );

  const ElectionAreaModel._();

  ElectionArea toEntity() => ElectionArea(
        id: id,
        name: name,
        code: code,
        stats: stats.toEntity(),
      );
}
