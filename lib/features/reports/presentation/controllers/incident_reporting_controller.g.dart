// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_reporting_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(IncidentReportingController)
final incidentReportingControllerProvider =
    IncidentReportingControllerProvider._();

final class IncidentReportingControllerProvider
    extends
        $NotifierProvider<IncidentReportingController, IncidentReportingState> {
  IncidentReportingControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'incidentReportingControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$incidentReportingControllerHash();

  @$internal
  @override
  IncidentReportingController create() => IncidentReportingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IncidentReportingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IncidentReportingState>(value),
    );
  }
}

String _$incidentReportingControllerHash() =>
    r'a96c3b84409b8943c4126850fea74e0df6fd28be';

abstract class _$IncidentReportingController
    extends $Notifier<IncidentReportingState> {
  IncidentReportingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<IncidentReportingState, IncidentReportingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<IncidentReportingState, IncidentReportingState>,
              IncidentReportingState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
