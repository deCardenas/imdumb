import 'package:imdumb/features/movies/02_domain/repositories/i_favorite_movie_repository.dart';

final class RemoveFavoriteMovieUseCase {
  final IFavoriteMovieRepository _movieRepository;

  const RemoveFavoriteMovieUseCase(this._movieRepository);

  Future<void> call(int id) {
    return _movieRepository.remove(id);
  }
}
