import 'package:imdumb/features/movies/02_domain/entities/movie.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_favorite_movie_repository.dart';

final class AddFavoriteMovieUseCase {
  final IFavoriteMovieRepository _movieRepository;

  const AddFavoriteMovieUseCase(this._movieRepository);

  Future<void> call(Movie movie) {
    return _movieRepository.add(movie);
  }
}
