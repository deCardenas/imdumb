import 'package:imdumb/features/movies/02_domain/entities/movie_detail.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

/// GetMovieDetailUseCase define el case de uso de obtener el detalle de la película
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Encapsula una única acción del negocio (obtener el detalle de la película).
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción IMoviesRepository y no de una implementación concreta.
///
/// - LSP (Liskov Substitution Principle):
///   Funciona con cualquier implementación válida del repositorio.
final class GetMovieDetailUseCase {
  final IMoviesRepository _repository;

  const GetMovieDetailUseCase(this._repository);

  Future<MovieDetail> call(int movieId) {
    return _repository.getMovieDetail(movieId);
  }
}
