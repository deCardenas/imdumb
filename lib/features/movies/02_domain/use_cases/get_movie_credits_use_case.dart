import 'package:imdumb/features/movies/02_domain/entities/credits_response.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

/// GetMovieCreditsUseCase define el case de uso de obtener los créditos(actores)
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Encapsula una única acción del negocio (obtener los créditos).
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción IMoviesRepository y no de una implementación concreta.
///
/// - LSP (Liskov Substitution Principle):
///   Funciona con cualquier implementación válida del repositorio.
final class GetMovieCreditsUseCase {
  final IMoviesRepository repository;

  const GetMovieCreditsUseCase(this.repository);

  Future<CreditsResponseEntity> call(int movieId) {
    return repository.getMovieCredits(movieId);
  }
}
