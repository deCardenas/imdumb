import 'package:imdumb/features/movies/02_domain/entities/images_response.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

/// GetMovieImagesUseCase define el case de uso de obtener las imágenes de la película
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Encapsula una única acción del negocio (obtener las imágenes de la película).
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción IMoviesRepository y no de una implementación concreta.
///
/// - LSP (Liskov Substitution Principle):
///   Funciona con cualquier implementación válida del repositorio.
final class GetMovieImagesUseCase {
  final IMoviesRepository repository;

  const GetMovieImagesUseCase(this.repository);

  Future<ImagesResponseEntity> call(int movieId) {
    return repository.getMovieImages(movieId);
  }
}
