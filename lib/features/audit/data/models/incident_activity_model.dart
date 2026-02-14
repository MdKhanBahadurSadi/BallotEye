import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ballot_eye/features/audit/domain/entities/incident_activity.dart';
import 'package:ballot_eye/core/utils/json_converters.dart';

part 'incident_activity_model.freezed.dart';
part 'incident_activity_model.g.dart';

@freezed
abstract class IncidentActivityModel with _$IncidentActivityModel {
  const factory IncidentActivityModel({
    required String id,
    required String userId,
    required String userName,
    required String type,
    required String note,
    @TimestampConverter() required DateTime timestamp,
  }) = _IncidentActivityModel;

  factory IncidentActivityModel.fromJson(Map<String, dynamic> json) => _$IncidentActivityModelFromJson(json);

  factory IncidentActivityModel.fromEntity(IncidentActivity activity) => IncidentActivityModel(
        id: activity.id,
        userId: activity.userId,
        userName: activity.userName,
        type: activity.type,
        note: activity.note,
        timestamp: activity.timestamp,
      );

  const IncidentActivityModel._();

  IncidentActivity toEntity() => IncidentActivity(
        id: id,
        userId: userId,
        userName: userName,
        type: type,
        note: note,
        timestamp: timestamp,
      );
}
