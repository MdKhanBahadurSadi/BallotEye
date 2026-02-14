import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ballot_eye/features/map/domain/entities/monitoring_area.dart';

part 'monitoring_area_model.freezed.dart';
part 'monitoring_area_model.g.dart';

@freezed
abstract class MonitoringAreaModel with _$MonitoringAreaModel {
  const factory MonitoringAreaModel({
    required String id,
    required String name,
    required String type,
    required Map<String, dynamic> geoJson,
  }) = _MonitoringAreaModel;

  factory MonitoringAreaModel.fromJson(Map<String, dynamic> json) => _$MonitoringAreaModelFromJson(json);

  factory MonitoringAreaModel.fromEntity(MonitoringArea area) => MonitoringAreaModel(
        id: area.id,
        name: area.name,
        type: area.type,
        geoJson: area.geoJson,
      );

  const MonitoringAreaModel._();

  MonitoringArea toEntity() => MonitoringArea(
        id: id,
        name: name,
        type: type,
        geoJson: geoJson,
      );
}
