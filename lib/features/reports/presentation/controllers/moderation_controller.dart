import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';
import 'package:ballot_eye/features/auth/presentation/controllers/auth_controller.dart';

part 'moderation_controller.g.dart';

@riverpod
class ModerationController extends _$ModerationController {
  @override
  Future<List<IncidentReport>> build({required String status}) async {
    final user = ref.watch(authControllerProvider).value;
    if (user == null) return [];

    // Enforce area scoping for moderators
    final areaIds = user.isModerator ? user.areaIds : null;

    return ref.watch(reportsRepositoryProvider).getReports(
      status: status,
      areaIds: areaIds,
    );
  }

  Future<void> updateStatus({
    required String reportId,
    required String newStatus,
    String? note,
    String? priority,
  }) async {
    final user = ref.read(authControllerProvider).value;
    if (user == null) throw Exception('Moderator not authenticated');

    await ref.read(reportsRepositoryProvider).updateReportStatus(
      id: reportId,
      status: newStatus,
      userId: user.id,
      userName: user.name,
      note: note,
      priority: priority,
    );
    
    // Refresh the list for the current status
    ref.invalidateSelf();
  }

  Future<void> fetchNextPage() async {
    final currentState = state.value ?? [];
    if (currentState.isEmpty) return;

    final user = ref.read(authControllerProvider).value;
    if (user == null) return;

    final areaIds = user.isModerator ? user.areaIds : null;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final nextBatch = await ref.read(reportsRepositoryProvider).getReports(
        status: status,
        areaIds: areaIds,
        lastReport: currentState.last,
      );
      return [...currentState, ...nextBatch];
    });
  }
}
