import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ballot_eye/features/leaderboard/domain/entities/election_area.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';

part 'leaderboard_controller.g.dart';

@riverpod
class LeaderboardController extends _$LeaderboardController {
  @override
  Future<List<ElectionArea>> build() async {
    return ref.watch(leaderboardRepositoryProvider).getLeaderboard();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(leaderboardRepositoryProvider).getLeaderboard());
  }
}

@riverpod
Future<ElectionArea> areaStats(Ref ref, String areaId) async {
  return ref.watch(leaderboardRepositoryProvider).getAreaStats(areaId);
}
