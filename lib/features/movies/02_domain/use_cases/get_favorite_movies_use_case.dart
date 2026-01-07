import 'package:imdumb/features/movies/02_domain/entities/movie.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_favorite_movie_repository.dart';

final class GetFavoriteMoviesUseCase {
  final IFavoriteMovieRepository _movieRepository;

  const GetFavoriteMoviesUseCase(this._movieRepository);

  List<Movie> call() {
    return _movieRepository.getAll();
  }
}
