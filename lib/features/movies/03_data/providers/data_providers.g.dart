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

@ProviderFor(favoritesBox)
final favoritesBoxProvider = FavoritesBoxProvider._();

final class FavoritesBoxProvider
    extends
        $FunctionalProvider<
          Box<FavoriteMovieHiveModel>,
          Box<FavoriteMovieHiveModel>,
          Box<FavoriteMovieHiveModel>
        >
    with $Provider<Box<FavoriteMovieHiveModel>> {
  FavoritesBoxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesBoxProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesBoxHash();

  @$internal
  @override
  $ProviderElement<Box<FavoriteMovieHiveModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Box<FavoriteMovieHiveModel> create(Ref ref) {
    return favoritesBox(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Box<FavoriteMovieHiveModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Box<FavoriteMovieHiveModel>>(value),
    );
  }
}

String _$favoritesBoxHash() => r'2343ec113851083d05698467846641e469253ec6';

@ProviderFor(favoriteDataStore)
final favoriteDataStoreProvider = FavoriteDataStoreProvider._();

final class FavoriteDataStoreProvider
    extends
        $FunctionalProvider<
          IFavoriteDataStore,
          IFavoriteDataStore,
          IFavoriteDataStore
        >
    with $Provider<IFavoriteDataStore> {
  FavoriteDataStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteDataStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteDataStoreHash();

  @$internal
  @override
  $ProviderElement<IFavoriteDataStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IFavoriteDataStore create(Ref ref) {
    return favoriteDataStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IFavoriteDataStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IFavoriteDataStore>(value),
    );
  }
}

String _$favoriteDataStoreHash() => r'a6e783546f0df0314b1eb812c6b1b86c71a7e63a';
