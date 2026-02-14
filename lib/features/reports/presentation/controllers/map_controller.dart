import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';

part 'map_controller.g.dart';

@riverpod
class MapController extends _$MapController {
  @override
  Future<List<IncidentReport>> build() async {
    return [];
  }

  Future<void> updateBounds(LatLngBounds bounds, {String? category, String? status}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(reportsRepositoryProvider).getReportsInBounds(
      northLat: bounds.northeast.latitude,
      southLat: bounds.southwest.latitude,
      eastLng: bounds.northeast.longitude,
      westLng: bounds.southwest.longitude,
      category: category,
      status: status,
    ));
  }
}
