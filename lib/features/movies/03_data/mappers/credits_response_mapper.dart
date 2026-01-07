import 'package:imdumb/features/movies/02_domain/entities/credits_response.dart';
import 'package:imdumb/features/movies/03_data/models/credits_response.dart';

/// CreditsResponseMapper define un mapper
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Su única responsabilidad es transformar un modelo de datos en una entidad de dominio.
/// - Open / Closed Principle (OCP):
///   Permite extender el mapeo agregando nuevas transformaciones sin afectar el código existente.
extension CreditsResponseMapper on CreditsResponse {
  CreditsResponseEntity toEntity() {
    return CreditsResponseEntity(
      id: id,
      cast: cast?.map((e) => e.toEntity()).toList(),
      crew: crew?.map((e) => e.toEntity()).toList(),
    );
  }
}

/// PersonModelMapper define un mapper
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Su única responsabilidad es transformar un modelo de datos en una entidad de dominio.
/// - Open / Closed Principle (OCP):
///   Permite extender el mapeo agregando nuevas transformaciones sin afectar el código existente.
extension PersonModelMapper on PersonModel {
  PersonEntity toEntity() {
    return PersonEntity(
      adult: adult,
      gender: gender,
      id: id,
      knownForDepartment: knownForDepartment,
      name: name,
      originalName: originalName,
      popularity: popularity,
      profilePath: profilePath,
      castId: castId,
      character: character,
      creditId: creditId,
      order: order,
    );
  }
}
