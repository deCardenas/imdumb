// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieListNotifier)
final movieListProvider = MovieListNotifierFamily._();

final class MovieListNotifierProvider
    extends $AsyncNotifierProvider<MovieListNotifier, MoviesPage> {
  MovieListNotifierProvider._({
    required MovieListNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'movieListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieListNotifierHash();

  @override
  String toString() {
    return r'movieListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MovieListNotifier create() => MovieListNotifier();

  @override
  bool operator ==(Object other) {
    return other is MovieListNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieListNotifierHash() => r'e9028f8834fbc50dffa63410689bf259e3d35562';

final class MovieListNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MovieListNotifier,
          AsyncValue<MoviesPage>,
          MoviesPage,
          FutureOr<MoviesPage>,
          String
        > {
  MovieListNotifierFamily._()
    : super(
        retry: null,
        name: r'movieListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieListNotifierProvider call(String list) =>
      MovieListNotifierProvider._(argument: list, from: this);

  @override
  String toString() => r'movieListProvider';
}

abstract class _$MovieListNotifier extends $AsyncNotifier<MoviesPage> {
  late final _$args = ref.$arg as String;
  String get list => _$args;

  FutureOr<MoviesPage> build(String list);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<MoviesPage>, MoviesPage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MoviesPage>, MoviesPage>,
              AsyncValue<MoviesPage>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
