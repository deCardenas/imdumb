import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_genres_use_case.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_movie_credits_use_case.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_movie_detail_use_case.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_movie_images_use_case.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_movies_by_genre_use_case.dart';
import 'package:imdumb/features/movies/03_data/providers/data_providers.dart';
import 'package:imdumb/features/movies/03_data/repositories/movies_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'domain_providers.g.dart';

@Riverpod(keepAlive: true)
IMoviesRepository moviesRepository(Ref ref) {
  final dataSource = ref.read(moviesRemoteDataSourceProvider);
  return MoviesRepository(dataSource);
}

@Riverpod(keepAlive: true)
GetGenresUseCase getGenresUseCase(Ref ref) {
  final repository = ref.read(moviesRepositoryProvider);
  return GetGenresUseCase(repository);
}

@Riverpod(keepAlive: true)
GetMoviesByGenreUseCase getMoviesByGenreUseCase(Ref ref) {
  final repository = ref.read(moviesRepositoryProvider);
  return GetMoviesByGenreUseCase(repository);
}

@Riverpod(keepAlive: true)
GetMovieDetailUseCase getMovieDetailUseCase(Ref ref) {
  final repository = ref.read(moviesRepositoryProvider);
  return GetMovieDetailUseCase(repository);
}

@Riverpod(keepAlive: true)
GetMovieImagesUseCase getMovieImagesUseCase(Ref ref) {
  final repository = ref.read(moviesRepositoryProvider);
  return GetMovieImagesUseCase(repository);
}

@Riverpod(keepAlive: true)
GetMovieCreditsUseCase getMovieCreditsUseCase(Ref ref) {
  final repository = ref.read(moviesRepositoryProvider);
  return GetMovieCreditsUseCase(repository);
}
