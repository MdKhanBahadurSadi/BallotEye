// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_feed_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReportsFeedController)
final reportsFeedControllerProvider = ReportsFeedControllerFamily._();

final class ReportsFeedControllerProvider
    extends
        $AsyncNotifierProvider<ReportsFeedController, List<IncidentReport>> {
  ReportsFeedControllerProvider._({
    required ReportsFeedControllerFamily super.from,
    required ({String? category, String? status}) super.argument,
  }) : super(
         retry: null,
         name: r'reportsFeedControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportsFeedControllerHash();

  @override
  String toString() {
    return r'reportsFeedControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ReportsFeedController create() => ReportsFeedController();

  @override
  bool operator ==(Object other) {
    return other is ReportsFeedControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportsFeedControllerHash() =>
    r'984e6d254e39486246fa5acdd100d221bc2a6e0c';

final class ReportsFeedControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ReportsFeedController,
          AsyncValue<List<IncidentReport>>,
          List<IncidentReport>,
          FutureOr<List<IncidentReport>>,
          ({String? category, String? status})
        > {
  ReportsFeedControllerFamily._()
    : super(
        retry: null,
        name: r'reportsFeedControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReportsFeedControllerProvider call({String? category, String? status}) =>
      ReportsFeedControllerProvider._(
        argument: (category: category, status: status),
        from: this,
      );

  @override
  String toString() => r'reportsFeedControllerProvider';
}

abstract class _$ReportsFeedController
    extends $AsyncNotifier<List<IncidentReport>> {
  late final _$args = ref.$arg as ({String? category, String? status});
  String? get category => _$args.category;
  String? get status => _$args.status;

  FutureOr<List<IncidentReport>> build({String? category, String? status});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<IncidentReport>>, List<IncidentReport>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<IncidentReport>>,
                List<IncidentReport>
              >,
              AsyncValue<List<IncidentReport>>,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(category: _$args.category, status: _$args.status),
    );
  }
}
