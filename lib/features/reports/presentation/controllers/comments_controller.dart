import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ballot_eye/features/comments/domain/entities/incident_comment.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';
import 'package:ballot_eye/features/auth/presentation/controllers/auth_controller.dart';
import 'package:uuid/uuid.dart';

part 'comments_controller.g.dart';

@riverpod
class CommentsController extends _$CommentsController {
  @override
  void build() {}

  Future<void> addComment({
    required String reportId,
    required String text,
    String? sentiment,
  }) async {
    final user = ref.read(authControllerProvider).value;
    if (user == null) throw Exception('User not authenticated');

    final comment = IncidentComment(
      id: const Uuid().v4(),
      userId: user.id,
      userName: user.name,
      text: text,
      timestamp: DateTime.now(),
      sentiment: sentiment,
    );

    await ref.read(reportsRepositoryProvider).addReportComment(reportId, comment);
  }
}
