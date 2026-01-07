import 'package:imdumb/features/movies/02_domain/entities/movie.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_favorite_movie_repository.dart';

/// GetFavoriteMoviesUseCase define el case de uso de obtener favoritos
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Encapsula una única acción del negocio (obtener favoritos).
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción IFavoriteMovieRepository y no de una implementación concreta.
///
/// - LSP (Liskov Substitution Principle):
///   Funciona con cualquier implementación válida del repositorio.
final class GetFavoriteMoviesUseCase {
  final IFavoriteMovieRepository _movieRepository;

  const GetFavoriteMoviesUseCase(this._movieRepository);

  List<Movie> call() {
    return _movieRepository.getAll();
  }
}
