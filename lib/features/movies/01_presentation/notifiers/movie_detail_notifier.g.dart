// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MoviesDetailNotifier)
final moviesDetailProvider = MoviesDetailNotifierFamily._();

final class MoviesDetailNotifierProvider
    extends $AsyncNotifierProvider<MoviesDetailNotifier, MovieDetailPage> {
  MoviesDetailNotifierProvider._({
    required MoviesDetailNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'moviesDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$moviesDetailNotifierHash();

  @override
  String toString() {
    return r'moviesDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MoviesDetailNotifier create() => MoviesDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is MoviesDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$moviesDetailNotifierHash() =>
    r'67508681e26f637ac1b01ee93b7df817ccd3f4e6';

final class MoviesDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MoviesDetailNotifier,
          AsyncValue<MovieDetailPage>,
          MovieDetailPage,
          FutureOr<MovieDetailPage>,
          int
        > {
  MoviesDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'moviesDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MoviesDetailNotifierProvider call(int movieId) =>
      MoviesDetailNotifierProvider._(argument: movieId, from: this);

  @override
  String toString() => r'moviesDetailProvider';
}

abstract class _$MoviesDetailNotifier extends $AsyncNotifier<MovieDetailPage> {
  late final _$args = ref.$arg as int;
  int get movieId => _$args;

  FutureOr<MovieDetailPage> build(int movieId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<MovieDetailPage>, MovieDetailPage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MovieDetailPage>, MovieDetailPage>,
              AsyncValue<MovieDetailPage>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
