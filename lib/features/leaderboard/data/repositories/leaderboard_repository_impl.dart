import 'package:ballot_eye/features/leaderboard/domain/entities/election_area.dart';
import 'package:ballot_eye/features/leaderboard/domain/repositories/leaderboard_repository.dart';
import 'package:ballot_eye/features/leaderboard/data/datasources/leaderboard_datasource.dart';

class LeaderboardRepositoryImpl implements LeaderboardRepository {
  final LeaderboardDatasource _datasource;

  LeaderboardRepositoryImpl(this._datasource);

  @override
  Future<List<ElectionArea>> getLeaderboard() => _datasource.getLeaderboard();

  @override
  Future<ElectionArea> getAreaStats(String areaId) => _datasource.getAreaStats(areaId);
}
