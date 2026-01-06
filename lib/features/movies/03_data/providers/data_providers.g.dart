// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(moviesRemoteDataSource)
final moviesRemoteDataSourceProvider = MoviesRemoteDataSourceProvider._();

final class MoviesRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          IMoviesDataSource,
          IMoviesDataSource,
          IMoviesDataSource
        >
    with $Provider<IMoviesDataSource> {
  MoviesRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviesRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviesRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<IMoviesDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IMoviesDataSource create(Ref ref) {
    return moviesRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IMoviesDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IMoviesDataSource>(value),
    );
  }
}

String _$moviesRemoteDataSourceHash() =>
    r'c93aab8010463a46879d91058879d91abfd08a1d';
