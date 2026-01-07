// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GenresNotifier)
final genresProvider = GenresNotifierProvider._();

final class GenresNotifierProvider
    extends $AsyncNotifierProvider<GenresNotifier, List<Genre>> {
  GenresNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'genresProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$genresNotifierHash();

  @$internal
  @override
  GenresNotifier create() => GenresNotifier();
}

String _$genresNotifierHash() => r'93755e6839539d638d818bd4dea82ca2d0e02b44';

abstract class _$GenresNotifier extends $AsyncNotifier<List<Genre>> {
  FutureOr<List<Genre>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Genre>>, List<Genre>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Genre>>, List<Genre>>,
              AsyncValue<List<Genre>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
