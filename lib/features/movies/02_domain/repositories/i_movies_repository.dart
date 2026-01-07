import 'package:imdumb/features/movies/02_domain/entities/credits_response.dart';
import 'package:imdumb/features/movies/02_domain/entities/genre.dart';
import 'package:imdumb/features/movies/02_domain/entities/images_response.dart';
import 'package:imdumb/features/movies/02_domain/entities/movie_detail.dart';
import 'package:imdumb/features/movies/02_domain/entities/movies_response.dart';

/// IMoviesRepository define el contrato del Repositorio
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Esta interface solo define operaciones HTTP, no implementa lógica.
///
/// - LSP (Liskov Substitution Principle):
///   Cualquier implementación que respete este contrato
///   puede sustituir a IMoviesRepository sin romper el comportamiento.
///
/// - ISP (Interface Segregation Principle):
///   La interface es pequeña y específica.
///   Los consumidores solo dependen de los métodos que realmente necesitan,
///   evitando contratos grandes y genéricos.
///
///
/// - DIP (Dependency Inversion):
///   Las capas superiores dependen de esta abstracción y no de Dio directamente.
abstract interface class IMoviesRepository {
  Future<List<Genre>> getGenres();
  Future<MoviesResponseEntity> getMoviesByGenre(int genreId, int page);
  Future<MovieDetail> getMovieDetail(int movieId);
  Future<ImagesResponseEntity> getMovieImages(int movieId);
  Future<CreditsResponseEntity> getMovieCredits(int movieId);
  Future<MoviesResponseEntity> getMovieList(String list, int page);
}
