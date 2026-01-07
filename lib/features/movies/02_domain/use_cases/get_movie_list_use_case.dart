import 'package:imdumb/features/movies/02_domain/entities/movies_response.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

final class GetMovieListUseCase {
  final IMoviesRepository repository;

  const GetMovieListUseCase(this.repository);

  Future<MoviesResponseEntity> call(String list, int page) {
    return repository.getMovieList(list, page);
  }
}
