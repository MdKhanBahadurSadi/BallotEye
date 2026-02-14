import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/core/utils/json_converters.dart';

part 'incident_report_model.freezed.dart';
part 'incident_report_model.g.dart';

@freezed
abstract class IncidentReportModel with _$IncidentReportModel {
  const factory IncidentReportModel({
    required String id,
    required String observerId,
    required String title,
    required String description,
    required String category,
    required String status,
    required double latitude,
    required double longitude,
    String? evidenceHash,
    required List<String> mediaUrls,
    @TimestampConverter() required DateTime timestamp,
    String? priority,
    String? internalNote,
  }) = _IncidentReportModel;

  factory IncidentReportModel.fromJson(Map<String, dynamic> json) => _$IncidentReportModelFromJson(json);

  factory IncidentReportModel.fromEntity(IncidentReport report) => IncidentReportModel(
        id: report.id,
        observerId: report.observerId,
        title: report.title,
        description: report.description,
        category: report.category,
        status: report.status,
        latitude: report.latitude,
        longitude: report.longitude,
        evidenceHash: report.evidenceHash,
        mediaUrls: report.mediaUrls,
        timestamp: report.timestamp,
        priority: report.priority,
        internalNote: report.internalNote,
      );

  const IncidentReportModel._();

  IncidentReport toEntity() => IncidentReport(
        id: id,
        observerId: observerId,
        title: title,
        description: description,
        category: category,
        status: status,
        latitude: latitude,
        longitude: longitude,
        evidenceHash: evidenceHash,
        mediaUrls: mediaUrls,
        timestamp: timestamp,
        priority: priority,
        internalNote: internalNote,
      );
}
