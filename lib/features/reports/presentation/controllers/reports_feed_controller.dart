import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';

part 'reports_feed_controller.g.dart';

@riverpod
class ReportsFeedController extends _$ReportsFeedController {
  @override
  Future<List<IncidentReport>> build({
    String? category,
    String? status,
  }) async {
    return ref.watch(reportsRepositoryProvider).getReports(
      category: category,
      status: status,
    );
  }

  Future<void> fetchNextPage() async {
    final currentState = state.value ?? [];
    if (currentState.isEmpty) return;

    state = const AsyncValue.loading();
    
    state = await AsyncValue.guard(() async {
      final nextBatch = await ref.read(reportsRepositoryProvider).getReports(
        category: category,
        status: status,
        lastReport: currentState.last,
      );
      return [...currentState, ...nextBatch];
    });
  }
}
