import 'package:imdumb/features/movies/02_domain/entities/movie_detail.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

final class GetMovieDetailUseCase {
  final IMoviesRepository _repository;

  const GetMovieDetailUseCase(this._repository);

  Future<MovieDetail> call(int movieId) {
    return _repository.getMovieDetail(movieId);
  }
}
