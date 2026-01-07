import 'package:imdumb/features/movies/02_domain/repositories/i_favorite_movie_repository.dart';

/// RemoveFavoriteMovieUseCase define el case de uso de remover de favoritos
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Encapsula una única acción del negocio (remover de favoritos).
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción IFavoriteMovieRepository y no de una implementación concreta.
///
/// - LSP (Liskov Substitution Principle):
///   Funciona con cualquier implementación válida del repositorio.
final class RemoveFavoriteMovieUseCase {
  final IFavoriteMovieRepository _movieRepository;

  const RemoveFavoriteMovieUseCase(this._movieRepository);

  Future<void> call(int id) {
    return _movieRepository.remove(id);
  }
}
