import 'package:imdumb/features/movies/02_domain/entities/movie.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_favorite_movie_repository.dart';

/// AddFavoriteMovieUseCase define el case de uso de agregar a favoritos
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Encapsula una única acción del negocio (agregar a favoritos).
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción IFavoriteMovieRepository y no de una implementación concreta.
///
/// - LSP (Liskov Substitution Principle):
///   Funciona con cualquier implementación válida del repositorio.
final class AddFavoriteMovieUseCase {
  final IFavoriteMovieRepository _movieRepository;

  const AddFavoriteMovieUseCase(this._movieRepository);

  Future<void> call(Movie movie) {
    return _movieRepository.add(movie);
  }
}
