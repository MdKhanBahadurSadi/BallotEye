import 'package:ballot_eye/features/leaderboard/domain/entities/election_area.dart';

abstract class LeaderboardDatasource {
  Future<List<ElectionArea>> getLeaderboard();
  Future<ElectionArea> getAreaStats(String areaId);
}
