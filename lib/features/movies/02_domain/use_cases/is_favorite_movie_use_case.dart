import 'package:imdumb/features/movies/02_domain/repositories/i_favorite_movie_repository.dart';

final class IsFavoriteMovieUseCase {
  final IFavoriteMovieRepository _movieRepository;

  const IsFavoriteMovieUseCase(this._movieRepository);

  bool call(int id) {
    return _movieRepository.isFavorite(id);
  }
}
