import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ballot_eye/features/comments/domain/entities/incident_comment.dart';
import 'package:ballot_eye/core/utils/json_converters.dart';

part 'incident_comment_model.freezed.dart';
part 'incident_comment_model.g.dart';

@freezed
abstract class IncidentCommentModel with _$IncidentCommentModel {
  const factory IncidentCommentModel({
    required String id,
    required String userId,
    required String userName,
    required String text,
    @TimestampConverter() required DateTime timestamp,
    String? sentiment,
  }) = _IncidentCommentModel;

  factory IncidentCommentModel.fromJson(Map<String, dynamic> json) => _$IncidentCommentModelFromJson(json);

  factory IncidentCommentModel.fromEntity(IncidentComment comment) => IncidentCommentModel(
        id: comment.id,
        userId: comment.userId,
        userName: comment.userName,
        text: comment.text,
        timestamp: comment.timestamp,
        sentiment: comment.sentiment,
      );

  const IncidentCommentModel._();

  IncidentComment toEntity() => IncidentComment(
        id: id,
        userId: userId,
        userName: userName,
        text: text,
        timestamp: timestamp,
        sentiment: sentiment,
      );
}
