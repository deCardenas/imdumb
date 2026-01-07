import 'package:imdumb/features/movies/02_domain/entities/movie.dart';

/// IFavoriteMovieRepository define el contrato del Repositorio
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Esta interface solo define operaciones de lectura y escritura, no implementa lógica.
///
/// - LSP (Liskov Substitution Principle):
///   Cualquier implementación que respete este contrato
///   puede sustituir a IFavoriteMovieRepository sin romper el comportamiento.
///
/// - ISP (Interface Segregation Principle):
///   La interface es pequeña y específica.
///   Los consumidores solo dependen de los métodos que realmente necesitan,
///   evitando contratos grandes y genéricos.
///
/// - DIP (Dependency Inversion):
///   Las capas superiores dependen de esta abstracción y no de implementaciones
///   concretas como Hive o cualquier otro storage.
abstract interface class IFavoriteMovieRepository {
  Future<void> add(Movie movie);
  Future<void> remove(int id);
  List<Movie> getAll();
  bool isFavorite(int id);
}
