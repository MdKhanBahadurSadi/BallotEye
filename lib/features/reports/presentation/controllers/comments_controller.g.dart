// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CommentsController)
final commentsControllerProvider = CommentsControllerProvider._();

final class CommentsControllerProvider
    extends $NotifierProvider<CommentsController, void> {
  CommentsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentsControllerHash();

  @$internal
  @override
  CommentsController create() => CommentsController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$commentsControllerHash() =>
    r'9a5dcdfa6c77b596d331de81f3c00a927067b41b';

abstract class _$CommentsController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
