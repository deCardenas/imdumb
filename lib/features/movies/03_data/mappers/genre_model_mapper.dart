import 'package:imdumb/features/movies/02_domain/entities/genre.dart';
import 'package:imdumb/features/movies/03_data/models/genres_response.dart';

/// GenreModelMapper define un mapper
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Su única responsabilidad es transformar un modelo de datos en una entidad de dominio.
/// - Open / Closed Principle (OCP):
///   Permite extender el mapeo agregando nuevas transformaciones sin afectar el código existente.
extension GenreModelMapper on GenreModel {
  Genre toEntity() {
    return Genre(id: id, name: name);
  }
}
