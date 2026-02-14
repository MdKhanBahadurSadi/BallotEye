// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LeaderboardController)
final leaderboardControllerProvider = LeaderboardControllerProvider._();

final class LeaderboardControllerProvider
    extends $AsyncNotifierProvider<LeaderboardController, List<ElectionArea>> {
  LeaderboardControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaderboardControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaderboardControllerHash();

  @$internal
  @override
  LeaderboardController create() => LeaderboardController();
}

String _$leaderboardControllerHash() =>
    r'412595d73d13faa94c3654fcfac2ed71f620646b';

abstract class _$LeaderboardController
    extends $AsyncNotifier<List<ElectionArea>> {
  FutureOr<List<ElectionArea>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ElectionArea>>, List<ElectionArea>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ElectionArea>>, List<ElectionArea>>,
              AsyncValue<List<ElectionArea>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(areaStats)
final areaStatsProvider = AreaStatsFamily._();

final class AreaStatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<ElectionArea>,
          ElectionArea,
          FutureOr<ElectionArea>
        >
    with $FutureModifier<ElectionArea>, $FutureProvider<ElectionArea> {
  AreaStatsProvider._({
    required AreaStatsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'areaStatsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$areaStatsHash();

  @override
  String toString() {
    return r'areaStatsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ElectionArea> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ElectionArea> create(Ref ref) {
    final argument = this.argument as String;
    return areaStats(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AreaStatsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$areaStatsHash() => r'228865887bbfacfeda353793fb70ac41bd36e126';

final class AreaStatsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ElectionArea>, String> {
  AreaStatsFamily._()
    : super(
        retry: null,
        name: r'areaStatsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AreaStatsProvider call(String areaId) =>
      AreaStatsProvider._(argument: areaId, from: this);

  @override
  String toString() => r'areaStatsProvider';
}
