import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident_reporting_controller.freezed.dart';
part 'incident_reporting_controller.g.dart';

@freezed
abstract class IncidentReportingState with _$IncidentReportingState {
  const factory IncidentReportingState({
    @Default(false) bool isSubmitting,
    @Default([]) List<File> mediaFiles,
    double? latitude,
    double? longitude,
    String? error,
  }) = _IncidentReportingState;
}

@riverpod
class IncidentReportingController extends _$IncidentReportingController {
  @override
  IncidentReportingState build() => const IncidentReportingState();

  void addMedia(File file) {
    state = state.copyWith(mediaFiles: [...state.mediaFiles, file]);
  }

  void removeMedia(int index) {
    final newList = [...state.mediaFiles];
    newList.removeAt(index);
    state = state.copyWith(mediaFiles: newList);
  }

  Future<void> captureLocation() async {
    try {
      final position = await ref.read(locationServiceProvider).getCurrentLocation();
      state = state.copyWith(
        latitude: position.latitude,
        longitude: position.longitude,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> submitReport({
    required String title,
    required String description,
    required String category,
  }) async {
    if (state.latitude == null || state.longitude == null) {
      state = state.copyWith(error: 'Location is required');
      return;
    }

    state = state.copyWith(isSubmitting: true, error: null);

    try {
      await ref.read(reportsRepositoryProvider).submitReport(
            title: title,
            description: description,
            category: category,
            latitude: state.latitude!,
            longitude: state.longitude!,
            mediaFiles: state.mediaFiles,
          );
      state = const IncidentReportingState(); // Reset on success
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());
      rethrow;
    }
  }
}
