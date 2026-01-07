import 'package:imdumb/features/movies/02_domain/repositories/i_favorite_movie_repository.dart';

/// IsFavoriteMovieUseCase define el case de uso de verificar si una película es favorita
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Encapsula una única acción del negocio (verificar si una película es favorita).
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción IFavoriteMovieRepository y no de una implementación concreta.
///
/// - LSP (Liskov Substitution Principle):
///   Funciona con cualquier implementación válida del repositorio.
final class IsFavoriteMovieUseCase {
  final IFavoriteMovieRepository _movieRepository;

  const IsFavoriteMovieUseCase(this._movieRepository);

  bool call(int id) {
    return _movieRepository.isFavorite(id);
  }
}
