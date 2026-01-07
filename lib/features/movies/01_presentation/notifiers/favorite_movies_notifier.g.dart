// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movies_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteMoviesNotifier)
final favoriteMoviesProvider = FavoriteMoviesNotifierProvider._();

final class FavoriteMoviesNotifierProvider
    extends $AsyncNotifierProvider<FavoriteMoviesNotifier, List<Movie>> {
  FavoriteMoviesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteMoviesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteMoviesNotifierHash();

  @$internal
  @override
  FavoriteMoviesNotifier create() => FavoriteMoviesNotifier();
}

String _$favoriteMoviesNotifierHash() =>
    r'ab2b3936fd75615ef451a9c5124a0e6aa17bca62';

abstract class _$FavoriteMoviesNotifier extends $AsyncNotifier<List<Movie>> {
  FutureOr<List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Movie>>, List<Movie>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Movie>>, List<Movie>>,
              AsyncValue<List<Movie>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
