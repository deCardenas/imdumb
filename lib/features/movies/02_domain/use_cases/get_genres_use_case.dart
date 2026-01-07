import 'package:imdumb/features/movies/02_domain/entities/genre.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

/// GetGenresUseCase define el case de uso de obtener la lista de géneros
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Encapsula una única acción del negocio (obtener la lista de géneros).
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción IMoviesRepository y no de una implementación concreta.
///
/// - LSP (Liskov Substitution Principle):
///   Funciona con cualquier implementación válida del repositorio.
final class GetGenresUseCase {
  final IMoviesRepository repository;

  const GetGenresUseCase(this.repository);

  Future<List<Genre>> call() {
    return repository.getGenres();
  }
}
