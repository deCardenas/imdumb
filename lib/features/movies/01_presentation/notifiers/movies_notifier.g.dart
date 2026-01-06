// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MoviesByGenreNotifier)
final moviesByGenreProvider = MoviesByGenreNotifierFamily._();

final class MoviesByGenreNotifierProvider
    extends $AsyncNotifierProvider<MoviesByGenreNotifier, MoviesPage> {
  MoviesByGenreNotifierProvider._({
    required MoviesByGenreNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'moviesByGenreProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$moviesByGenreNotifierHash();

  @override
  String toString() {
    return r'moviesByGenreProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MoviesByGenreNotifier create() => MoviesByGenreNotifier();

  @override
  bool operator ==(Object other) {
    return other is MoviesByGenreNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$moviesByGenreNotifierHash() =>
    r'05b65f6412a6f71ff344bea8ab1a1bfe66ad2583';

final class MoviesByGenreNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MoviesByGenreNotifier,
          AsyncValue<MoviesPage>,
          MoviesPage,
          FutureOr<MoviesPage>,
          int
        > {
  MoviesByGenreNotifierFamily._()
    : super(
        retry: null,
        name: r'moviesByGenreProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MoviesByGenreNotifierProvider call(int genreId) =>
      MoviesByGenreNotifierProvider._(argument: genreId, from: this);

  @override
  String toString() => r'moviesByGenreProvider';
}

abstract class _$MoviesByGenreNotifier extends $AsyncNotifier<MoviesPage> {
  late final _$args = ref.$arg as int;
  int get genreId => _$args;

  FutureOr<MoviesPage> build(int genreId);
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
