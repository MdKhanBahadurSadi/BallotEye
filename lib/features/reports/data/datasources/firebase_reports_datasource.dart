import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ballot_eye/features/reports/data/datasources/reports_datasource.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/features/reports/data/models/incident_report_model.dart';
import 'package:ballot_eye/features/comments/domain/entities/incident_comment.dart';
import 'package:ballot_eye/features/comments/data/models/incident_comment_model.dart';
import 'package:ballot_eye/features/audit/domain/entities/incident_activity.dart';
import 'package:ballot_eye/features/audit/data/models/incident_activity_model.dart';
import 'package:ballot_eye/core/error/failures.dart';

class FirebaseReportsDatasource implements ReportsDatasource {
  final FirebaseFirestore _firestore;

  FirebaseReportsDatasource(this._firestore);

  @override
  Future<String> createReport(IncidentReport report) async {
    try {
      final docRef = _firestore.collection('reports').doc();
      final model = IncidentReportModel.fromEntity(report).copyWith(id: docRef.id);
      await docRef.set(model.toJson());
      
      // Log initial activity
      await _logActivity(docRef.id, report.observerId, 'Unknown', 'report_created', 'Incident reported');
      
      return docRef.id;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<IncidentReport>> getReports({
    int limit = 20,
    IncidentReport? lastReport,
    String? category,
    String? status,
    List<String>? areaIds,
  }) async {
    try {
      Query query = _firestore.collection('reports')
          .orderBy('timestamp', descending: true);

      if (category != null && category.isNotEmpty) {
        query = query.where('category', isEqualTo: category);
      }

      if (status != null && status.isNotEmpty) {
        query = query.where('status', isEqualTo: status);
      }

      if (areaIds != null && areaIds.isNotEmpty) {
        query = query.where('areaId', whereIn: areaIds);
      }

      if (lastReport != null) {
        final lastDoc = await _firestore.collection('reports').doc(lastReport.id).get();
        if (lastDoc.exists) {
          query = query.startAfterDocument(lastDoc);
        }
      }

      final snapshot = await query.limit(limit).get();
      return snapshot.docs
          .map((doc) => IncidentReportModel.fromJson(doc.data() as Map<String, dynamic>).toEntity())
          .toList();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<IncidentReport>> getReportsInBounds({
    required double northLat,
    required double southLat,
    required double eastLng,
    required double westLng,
    String? category,
    String? status,
  }) async {
    try {
      // Note: Firestore can only do inequality on one field.
      // We'll query by latitude range and filter longitude client-side for simplicity in MVP.
      Query query = _firestore.collection('reports')
          .where('latitude', isGreaterThanOrEqualTo: southLat)
          .where('latitude', isLessThanOrEqualTo: northLat);

      if (category != null && category.isNotEmpty) {
        query = query.where('category', isEqualTo: category);
      }

      if (status != null && status.isNotEmpty) {
        query = query.where('status', isEqualTo: status);
      }

      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => IncidentReportModel.fromJson(doc.data() as Map<String, dynamic>).toEntity())
          .where((report) {
            // Client-side longitude filtering
            if (westLng <= eastLng) {
              return report.longitude >= westLng && report.longitude <= eastLng;
            } else {
              // Handle wrap around (dateline)
              return report.longitude >= westLng || report.longitude <= eastLng;
            }
          })
          .toList();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<IncidentReport> getReport(String id) async {
    try {
      final doc = await _firestore.collection('reports').doc(id).get();
      if (!doc.exists) throw const ServerFailure('Report not found');
      return IncidentReportModel.fromJson(doc.data()!).toEntity();
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Stream<List<IncidentReport>> watchReports() {
    return _firestore.collection('reports')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => IncidentReportModel.fromJson(doc.data()).toEntity())
            .toList());
  }

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
      final updates = <String, dynamic>{'status': status};
      if (priority != null) updates['priority'] = priority;
      if (note != null) updates['internalNote'] = note;

      await _firestore.collection('reports').doc(id).update(updates);
      await _logActivity(id, userId, userName, 'status_change', 'Status updated to $status${priority != null ? " with $priority priority" : ""}. Note: ${note ?? "No internal note"}');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<void> addComment(String reportId, IncidentComment comment) async {
    try {
      final docRef = _firestore.collection('reports').doc(reportId).collection('comments').doc();
      final model = IncidentCommentModel.fromEntity(comment).copyWith(id: docRef.id);
      await docRef.set(model.toJson());
      
      await _logActivity(reportId, comment.userId, comment.userName, 'comment_added', 'New comment added');
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Stream<List<IncidentComment>> watchComments(String reportId) {
    return _firestore.collection('reports').doc(reportId).collection('comments')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => IncidentCommentModel.fromJson(doc.data()).toEntity())
            .toList());
  }

  @override
  Stream<List<IncidentActivity>> watchActivity(String reportId) {
    return _firestore.collection('reports').doc(reportId).collection('activity')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => IncidentActivityModel.fromJson(doc.data()).toEntity())
            .toList());
  }

  Future<void> _logActivity(String reportId, String userId, String userName, String type, String note) async {
    final docRef = _firestore.collection('reports').doc(reportId).collection('activity').doc();
    final activity = IncidentActivityModel(
      id: docRef.id,
      userId: userId,
      userName: userName,
      type: type,
      note: note,
      timestamp: DateTime.now(),
    );
    await docRef.set(activity.toJson());
  }
}
