// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(moviesRepository)
final moviesRepositoryProvider = MoviesRepositoryProvider._();

final class MoviesRepositoryProvider
    extends
        $FunctionalProvider<
          IMoviesRepository,
          IMoviesRepository,
          IMoviesRepository
        >
    with $Provider<IMoviesRepository> {
  MoviesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moviesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moviesRepositoryHash();

  @$internal
  @override
  $ProviderElement<IMoviesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IMoviesRepository create(Ref ref) {
    return moviesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IMoviesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IMoviesRepository>(value),
    );
  }
}

String _$moviesRepositoryHash() => r'ae235e951ae6019e3cc60994c846efd8340005aa';

@ProviderFor(getGenresUseCase)
final getGenresUseCaseProvider = GetGenresUseCaseProvider._();

final class GetGenresUseCaseProvider
    extends
        $FunctionalProvider<
          GetGenresUseCase,
          GetGenresUseCase,
          GetGenresUseCase
        >
    with $Provider<GetGenresUseCase> {
  GetGenresUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getGenresUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getGenresUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetGenresUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetGenresUseCase create(Ref ref) {
    return getGenresUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetGenresUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetGenresUseCase>(value),
    );
  }
}

String _$getGenresUseCaseHash() => r'e782693cb17cc52feda451079965cc14bbc0bad3';

@ProviderFor(getMoviesByGenreUseCase)
final getMoviesByGenreUseCaseProvider = GetMoviesByGenreUseCaseProvider._();

final class GetMoviesByGenreUseCaseProvider
    extends
        $FunctionalProvider<
          GetMoviesByGenreUseCase,
          GetMoviesByGenreUseCase,
          GetMoviesByGenreUseCase
        >
    with $Provider<GetMoviesByGenreUseCase> {
  GetMoviesByGenreUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMoviesByGenreUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMoviesByGenreUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMoviesByGenreUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMoviesByGenreUseCase create(Ref ref) {
    return getMoviesByGenreUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMoviesByGenreUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMoviesByGenreUseCase>(value),
    );
  }
}

String _$getMoviesByGenreUseCaseHash() =>
    r'3e5f910492f4e820d761388a0801099d35023f26';

@ProviderFor(getMovieDetailUseCase)
final getMovieDetailUseCaseProvider = GetMovieDetailUseCaseProvider._();

final class GetMovieDetailUseCaseProvider
    extends
        $FunctionalProvider<
          GetMovieDetailUseCase,
          GetMovieDetailUseCase,
          GetMovieDetailUseCase
        >
    with $Provider<GetMovieDetailUseCase> {
  GetMovieDetailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMovieDetailUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMovieDetailUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMovieDetailUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMovieDetailUseCase create(Ref ref) {
    return getMovieDetailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMovieDetailUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMovieDetailUseCase>(value),
    );
  }
}

String _$getMovieDetailUseCaseHash() =>
    r'80cb0c4ab62e1523918f90108073ed8aacbb8c7c';

@ProviderFor(getMovieImagesUseCase)
final getMovieImagesUseCaseProvider = GetMovieImagesUseCaseProvider._();

final class GetMovieImagesUseCaseProvider
    extends
        $FunctionalProvider<
          GetMovieImagesUseCase,
          GetMovieImagesUseCase,
          GetMovieImagesUseCase
        >
    with $Provider<GetMovieImagesUseCase> {
  GetMovieImagesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMovieImagesUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMovieImagesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMovieImagesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMovieImagesUseCase create(Ref ref) {
    return getMovieImagesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMovieImagesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMovieImagesUseCase>(value),
    );
  }
}

String _$getMovieImagesUseCaseHash() =>
    r'a616742333eb2338f95e1fff700dfb8f3f6f8158';

@ProviderFor(getMovieCreditsUseCase)
final getMovieCreditsUseCaseProvider = GetMovieCreditsUseCaseProvider._();

final class GetMovieCreditsUseCaseProvider
    extends
        $FunctionalProvider<
          GetMovieCreditsUseCase,
          GetMovieCreditsUseCase,
          GetMovieCreditsUseCase
        >
    with $Provider<GetMovieCreditsUseCase> {
  GetMovieCreditsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMovieCreditsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMovieCreditsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMovieCreditsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMovieCreditsUseCase create(Ref ref) {
    return getMovieCreditsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMovieCreditsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMovieCreditsUseCase>(value),
    );
  }
}

String _$getMovieCreditsUseCaseHash() =>
    r'c0ea5579bb25487befe5b2a291b2c91ef38347ee';

@ProviderFor(getMovieListUseCase)
final getMovieListUseCaseProvider = GetMovieListUseCaseProvider._();

final class GetMovieListUseCaseProvider
    extends
        $FunctionalProvider<
          GetMovieListUseCase,
          GetMovieListUseCase,
          GetMovieListUseCase
        >
    with $Provider<GetMovieListUseCase> {
  GetMovieListUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMovieListUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMovieListUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMovieListUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMovieListUseCase create(Ref ref) {
    return getMovieListUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMovieListUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMovieListUseCase>(value),
    );
  }
}

String _$getMovieListUseCaseHash() =>
    r'10af90d22d5abac882c05be2639e8c4b6f58dda9';

@ProviderFor(favoriteMovieRepository)
final favoriteMovieRepositoryProvider = FavoriteMovieRepositoryProvider._();

final class FavoriteMovieRepositoryProvider
    extends
        $FunctionalProvider<
          IFavoriteMovieRepository,
          IFavoriteMovieRepository,
          IFavoriteMovieRepository
        >
    with $Provider<IFavoriteMovieRepository> {
  FavoriteMovieRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteMovieRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteMovieRepositoryHash();

  @$internal
  @override
  $ProviderElement<IFavoriteMovieRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IFavoriteMovieRepository create(Ref ref) {
    return favoriteMovieRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IFavoriteMovieRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IFavoriteMovieRepository>(value),
    );
  }
}

String _$favoriteMovieRepositoryHash() =>
    r'2efadefd6a41d91cdf028332d637f47480c39735';

@ProviderFor(addFavoriteMovieUseCase)
final addFavoriteMovieUseCaseProvider = AddFavoriteMovieUseCaseProvider._();

final class AddFavoriteMovieUseCaseProvider
    extends
        $FunctionalProvider<
          AddFavoriteMovieUseCase,
          AddFavoriteMovieUseCase,
          AddFavoriteMovieUseCase
        >
    with $Provider<AddFavoriteMovieUseCase> {
  AddFavoriteMovieUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addFavoriteMovieUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addFavoriteMovieUseCaseHash();

  @$internal
  @override
  $ProviderElement<AddFavoriteMovieUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddFavoriteMovieUseCase create(Ref ref) {
    return addFavoriteMovieUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddFavoriteMovieUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddFavoriteMovieUseCase>(value),
    );
  }
}

String _$addFavoriteMovieUseCaseHash() =>
    r'aa472cad14560bee15988c96f7e32331160b1658';

@ProviderFor(removeFavoriteMovieUseCase)
final removeFavoriteMovieUseCaseProvider =
    RemoveFavoriteMovieUseCaseProvider._();

final class RemoveFavoriteMovieUseCaseProvider
    extends
        $FunctionalProvider<
          RemoveFavoriteMovieUseCase,
          RemoveFavoriteMovieUseCase,
          RemoveFavoriteMovieUseCase
        >
    with $Provider<RemoveFavoriteMovieUseCase> {
  RemoveFavoriteMovieUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'removeFavoriteMovieUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$removeFavoriteMovieUseCaseHash();

  @$internal
  @override
  $ProviderElement<RemoveFavoriteMovieUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RemoveFavoriteMovieUseCase create(Ref ref) {
    return removeFavoriteMovieUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoveFavoriteMovieUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoveFavoriteMovieUseCase>(value),
    );
  }
}

String _$removeFavoriteMovieUseCaseHash() =>
    r'b78a90780135dd3f2e1f0f290640ebecb8e6b07e';

@ProviderFor(getFavoriteMoviesUseCase)
final getFavoriteMoviesUseCaseProvider = GetFavoriteMoviesUseCaseProvider._();

final class GetFavoriteMoviesUseCaseProvider
    extends
        $FunctionalProvider<
          GetFavoriteMoviesUseCase,
          GetFavoriteMoviesUseCase,
          GetFavoriteMoviesUseCase
        >
    with $Provider<GetFavoriteMoviesUseCase> {
  GetFavoriteMoviesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFavoriteMoviesUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFavoriteMoviesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetFavoriteMoviesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetFavoriteMoviesUseCase create(Ref ref) {
    return getFavoriteMoviesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetFavoriteMoviesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetFavoriteMoviesUseCase>(value),
    );
  }
}

String _$getFavoriteMoviesUseCaseHash() =>
    r'3bf215b5c285b0e205bf85980d318056f4a76ac2';

@ProviderFor(isFavoriteMovieUseCase)
final isFavoriteMovieUseCaseProvider = IsFavoriteMovieUseCaseProvider._();

final class IsFavoriteMovieUseCaseProvider
    extends
        $FunctionalProvider<
          IsFavoriteMovieUseCase,
          IsFavoriteMovieUseCase,
          IsFavoriteMovieUseCase
        >
    with $Provider<IsFavoriteMovieUseCase> {
  IsFavoriteMovieUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isFavoriteMovieUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isFavoriteMovieUseCaseHash();

  @$internal
  @override
  $ProviderElement<IsFavoriteMovieUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IsFavoriteMovieUseCase create(Ref ref) {
    return isFavoriteMovieUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IsFavoriteMovieUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IsFavoriteMovieUseCase>(value),
    );
  }
}

String _$isFavoriteMovieUseCaseHash() =>
    r'1d36c2b4867efbe03bfc0e0545c12cd76a2e4850';
