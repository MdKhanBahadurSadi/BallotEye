import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/features/comments/domain/entities/incident_comment.dart';
import 'package:ballot_eye/features/audit/domain/entities/incident_activity.dart';

abstract class ReportsDatasource {
  // Reports
  Future<String> createReport(IncidentReport report);
  Future<IncidentReport> getReport(String id);
  Future<List<IncidentReport>> getReports({
    int limit = 20,
    IncidentReport? lastReport,
    String? category,
    String? status,
    List<String>? areaIds,
  });

  Future<List<IncidentReport>> getReportsInBounds({
    required double northLat,
    required double southLat,
    required double eastLng,
    required double westLng,
    String? category,
    String? status,
  });

  Stream<List<IncidentReport>> watchReports();
  Future<void> updateReportStatus({
    required String id,
    required String status,
    required String userId,
    required String userName,
    String? note,
    String? priority,
  });
  
  // Comments
  Future<void> addComment(String reportId, IncidentComment comment);
  Stream<List<IncidentComment>> watchComments(String reportId);
  
  // Activity
  Stream<List<IncidentActivity>> watchActivity(String reportId);
}
