import 'package:imdumb/features/movies/02_domain/entities/movies_response.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

/// GetMoviesByGenreUseCase define el case de uso de obtener la lista películas por genero
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Encapsula una única acción del negocio (obtener la lista películas por genero).
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción IMoviesRepository y no de una implementación concreta.
///
/// - LSP (Liskov Substitution Principle):
///   Funciona con cualquier implementación válida del repositorio.
final class GetMoviesByGenreUseCase {
  final IMoviesRepository repository;

  const GetMoviesByGenreUseCase(this.repository);

  Future<MoviesResponseEntity> call(int genreId, int page) {
    return repository.getMoviesByGenre(genreId, page);
  }
}
