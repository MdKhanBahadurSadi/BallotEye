// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reportDetail)
final reportDetailProvider = ReportDetailFamily._();

final class ReportDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<IncidentReport>,
          IncidentReport,
          FutureOr<IncidentReport>
        >
    with $FutureModifier<IncidentReport>, $FutureProvider<IncidentReport> {
  ReportDetailProvider._({
    required ReportDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'reportDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportDetailHash();

  @override
  String toString() {
    return r'reportDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<IncidentReport> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<IncidentReport> create(Ref ref) {
    final argument = this.argument as String;
    return reportDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportDetailHash() => r'3bf43cf12dad1526fcc6965ef5f830ea9a15979e';

final class ReportDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<IncidentReport>, String> {
  ReportDetailFamily._()
    : super(
        retry: null,
        name: r'reportDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReportDetailProvider call(String id) =>
      ReportDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'reportDetailProvider';
}

@ProviderFor(reportActivity)
final reportActivityProvider = ReportActivityFamily._();

final class ReportActivityProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IncidentActivity>>,
          List<IncidentActivity>,
          Stream<List<IncidentActivity>>
        >
    with
        $FutureModifier<List<IncidentActivity>>,
        $StreamProvider<List<IncidentActivity>> {
  ReportActivityProvider._({
    required ReportActivityFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'reportActivityProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportActivityHash();

  @override
  String toString() {
    return r'reportActivityProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<IncidentActivity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<IncidentActivity>> create(Ref ref) {
    final argument = this.argument as String;
    return reportActivity(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportActivityProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportActivityHash() => r'918836cf2d01c20c85a4316be26abe5f1570bc5d';

final class ReportActivityFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<IncidentActivity>>, String> {
  ReportActivityFamily._()
    : super(
        retry: null,
        name: r'reportActivityProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReportActivityProvider call(String id) =>
      ReportActivityProvider._(argument: id, from: this);

  @override
  String toString() => r'reportActivityProvider';
}

@ProviderFor(reportComments)
final reportCommentsProvider = ReportCommentsFamily._();

final class ReportCommentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<IncidentComment>>,
          List<IncidentComment>,
          Stream<List<IncidentComment>>
        >
    with
        $FutureModifier<List<IncidentComment>>,
        $StreamProvider<List<IncidentComment>> {
  ReportCommentsProvider._({
    required ReportCommentsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'reportCommentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportCommentsHash();

  @override
  String toString() {
    return r'reportCommentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<IncidentComment>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<IncidentComment>> create(Ref ref) {
    final argument = this.argument as String;
    return reportComments(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportCommentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportCommentsHash() => r'c5d7f10409e53494dee040db2ac56beeb7e9e208';

final class ReportCommentsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<IncidentComment>>, String> {
  ReportCommentsFamily._()
    : super(
        retry: null,
        name: r'reportCommentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReportCommentsProvider call(String id) =>
      ReportCommentsProvider._(argument: id, from: this);

  @override
  String toString() => r'reportCommentsProvider';
}
