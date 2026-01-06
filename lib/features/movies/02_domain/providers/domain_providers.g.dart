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
