import 'package:imdumb/features/movies/02_domain/entities/movies_response.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

/// GetMovieListUseCase define el case de uso de obtener la lista películas por categoría
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Encapsula una única acción del negocio (obtener la lista películas por categoría).
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción IMoviesRepository y no de una implementación concreta.
///
/// - LSP (Liskov Substitution Principle):
///   Funciona con cualquier implementación válida del repositorio.
final class GetMovieListUseCase {
  final IMoviesRepository repository;

  const GetMovieListUseCase(this.repository);

  Future<MoviesResponseEntity> call(String list, int page) {
    return repository.getMovieList(list, page);
  }
}
