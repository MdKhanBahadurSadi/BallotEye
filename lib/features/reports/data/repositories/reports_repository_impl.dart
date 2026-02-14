import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/features/reports/domain/repositories/reports_repository.dart';
import 'package:ballot_eye/features/reports/data/datasources/reports_datasource.dart';
import 'package:ballot_eye/core/services/storage_service.dart';
import 'package:ballot_eye/core/utils/hash_utils.dart';
import 'package:ballot_eye/features/auth/domain/repositories/auth_repository.dart';
import 'package:ballot_eye/features/audit/domain/entities/incident_activity.dart';
import 'package:ballot_eye/features/comments/domain/entities/incident_comment.dart';

import 'package:ballot_eye/core/utils/app_services.dart';

class ReportsRepositoryImpl implements ReportsRepository {
  final ReportsDatasource _datasource;
  final FirebaseStorageService _storageService;
  final AuthRepository _authRepository;

  ReportsRepositoryImpl(this._datasource, this._storageService, this._authRepository);

  @override
  Future<String> submitReport({
    required String title,
    required String description,
    required String category,
    required double latitude,
    required double longitude,
    required List<File> mediaFiles,
    String? areaId,
  }) async {
    try {
      AppLogger.d('Submitting report: $title');
      final user = await _authRepository.getCurrentUser();
      if (user == null) throw Exception('User not authenticated');

      final reportId = const Uuid().v4();
      final List<String> mediaUrls = [];
      String combinedHashes = '';

      for (var file in mediaFiles) {
        final url = await _storageService.uploadEvidence(reportId, file);
        mediaUrls.add(url);
        
        final hash = await HashUtils.calculateSHA256(file);
        combinedHashes += hash;
      }

      final finalHash = combinedHashes.isNotEmpty 
          ? await HashUtils.calculateSHA256String(combinedHashes)
          : '';

      final report = IncidentReport(
        id: reportId,
        observerId: user.id,
        title: title,
        description: description,
        category: category,
        status: 'submitted',
        latitude: latitude,
        longitude: longitude,
        mediaUrls: mediaUrls,
        evidenceHash: finalHash,
        timestamp: DateTime.now(),
      );

      final id = await _datasource.createReport(report);
      AppAnalytics.logEvent('report_submitted', {'category': category, 'reportId': id});
      return id;
    } catch (e, stack) {
      AppLogger.e('Failed to submit report', e, stack);
      rethrow;
    }
  }

  @override
  Stream<List<IncidentReport>> watchReports() => _datasource.watchReports();

  @override
  Future<IncidentReport> getReport(String id) {
    AppAnalytics.logEvent('view_report', {'reportId': id});
    return _datasource.getReport(id);
  }

  @override
  Future<List<IncidentReport>> getReports({
    int limit = 20,
    IncidentReport? lastReport,
    String? category,
    String? status,
    List<String>? areaIds,
  }) {
    AppAnalytics.logEvent('fetch_reports', {'category': category, 'status': status});
    return _datasource.getReports(
      limit: limit,
      lastReport: lastReport,
      category: category,
      status: status,
      areaIds: areaIds,
    );
  }

  @override
  Future<List<IncidentReport>> getReportsInBounds({
    required double northLat,
    required double southLat,
    required double eastLng,
    required double westLng,
    String? category,
    String? status,
  }) => _datasource.getReportsInBounds(
        northLat: northLat,
        southLat: southLat,
        eastLng: eastLng,
        westLng: westLng,
        category: category,
        status: status,
      );

  @override
  Future<void> updateReportStatus({
    required String id,
    required String status,
    required String userId,
    required String userName,
    String? note,
    String? priority,
  }) async {
    try {
      AppLogger.d('Updating report status: $id to $status');
      await _datasource.updateReportStatus(
        id: id,
        status: status,
        userId: userId,
        userName: userName,
        note: note,
        priority: priority,
      );
      AppAnalytics.logEvent('report_status_updated', {'reportId': id, 'new_status': status});
    } catch (e, stack) {
      AppLogger.e('Failed to update report status', e, stack);
      rethrow;
    }
  }

  @override
  Stream<List<IncidentActivity>> watchReportActivity(String reportId) => 
      _datasource.watchActivity(reportId);

  @override
  Stream<List<IncidentComment>> watchReportComments(String reportId) => 
      _datasource.watchComments(reportId);

  @override
  Future<void> addReportComment(String reportId, IncidentComment comment) async {
    try {
      await _datasource.addComment(reportId, comment);
      AppAnalytics.logEvent('comment_added', {'reportId': reportId, 'sentiment': comment.sentiment});
    } catch (e, stack) {
      AppLogger.e('Failed to add comment', e, stack);
      rethrow;
    }
  }
}
