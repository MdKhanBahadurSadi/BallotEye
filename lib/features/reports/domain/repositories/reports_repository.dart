import 'dart:io';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/features/audit/domain/entities/incident_activity.dart';
import 'package:ballot_eye/features/comments/domain/entities/incident_comment.dart';

abstract class ReportsRepository {
  Future<String> submitReport({
    required String title,
    required String description,
    required String category,
    required double latitude,
    required double longitude,
    required List<File> mediaFiles,
    String? areaId,
  });

  Stream<List<IncidentReport>> watchReports();
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

  Future<void> updateReportStatus({
    required String id,
    required String status,
    required String userId,
    required String userName,
    String? note,
    String? priority,
  });

  Stream<List<IncidentActivity>> watchReportActivity(String reportId);
  Stream<List<IncidentComment>> watchReportComments(String reportId);
  Future<void> addReportComment(String reportId, IncidentComment comment);
}
