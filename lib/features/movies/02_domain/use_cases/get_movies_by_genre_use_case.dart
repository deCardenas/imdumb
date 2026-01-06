import 'package:imdumb/features/movies/02_domain/entities/movies_response.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

final class GetMoviesByGenreUseCase {
  final IMoviesRepository repository;

  const GetMoviesByGenreUseCase(this.repository);

  Future<MoviesResponseEntity> call(int genreId, int page) {
    return repository.getMoviesByGenre(genreId, page);
  }
}
