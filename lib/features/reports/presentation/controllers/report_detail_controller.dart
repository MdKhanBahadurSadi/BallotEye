import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/features/audit/domain/entities/incident_activity.dart';
import 'package:ballot_eye/features/comments/domain/entities/incident_comment.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';

part 'report_detail_controller.g.dart';

@riverpod
Future<IncidentReport> reportDetail(Ref ref, String id) {
  return ref.watch(reportsRepositoryProvider).getReport(id);
}

@riverpod
Stream<List<IncidentActivity>> reportActivity(Ref ref, String id) {
  return ref.watch(reportsRepositoryProvider).watchReportActivity(id);
}

@riverpod
Stream<List<IncidentComment>> reportComments(Ref ref, String id) {
  return ref.watch(reportsRepositoryProvider).watchReportComments(id);
}
