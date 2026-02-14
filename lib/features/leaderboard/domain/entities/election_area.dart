import 'package:ballot_eye/features/leaderboard/domain/entities/area_stats.dart';

class ElectionArea {
  final String id;
  final String name;
  final String code;
  final AreaStats stats;

  const ElectionArea({
    required this.id,
    required this.name,
    required this.code,
    required this.stats,
  });
}
