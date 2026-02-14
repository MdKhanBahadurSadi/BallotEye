// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ModerationController)
final moderationControllerProvider = ModerationControllerFamily._();

final class ModerationControllerProvider
    extends $AsyncNotifierProvider<ModerationController, List<IncidentReport>> {
  ModerationControllerProvider._({
    required ModerationControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'moderationControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$moderationControllerHash();

  @override
  String toString() {
    return r'moderationControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ModerationController create() => ModerationController();

  @override
  bool operator ==(Object other) {
    return other is ModerationControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$moderationControllerHash() =>
    r'576279de122fe7df4905086130ca7991bf8e0ab4';

final class ModerationControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ModerationController,
          AsyncValue<List<IncidentReport>>,
          List<IncidentReport>,
          FutureOr<List<IncidentReport>>,
          String
        > {
  ModerationControllerFamily._()
    : super(
        retry: null,
        name: r'moderationControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ModerationControllerProvider call({required String status}) =>
      ModerationControllerProvider._(argument: status, from: this);

  @override
  String toString() => r'moderationControllerProvider';
}

abstract class _$ModerationController
    extends $AsyncNotifier<List<IncidentReport>> {
  late final _$args = ref.$arg as String;
  String get status => _$args;

  FutureOr<List<IncidentReport>> build({required String status});
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
    element.handleCreate(ref, () => build(status: _$args));
  }
}
