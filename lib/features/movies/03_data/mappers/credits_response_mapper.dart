import 'package:imdumb/features/movies/02_domain/entities/credits_response.dart';
import 'package:imdumb/features/movies/03_data/models/credits_response.dart';

extension CreditsResponseMapper on CreditsResponse {
  CreditsResponseEntity toEntity() {
    return CreditsResponseEntity(
      id: id,
      cast: cast?.map((e) => e.toEntity()).toList(),
      crew: crew?.map((e) => e.toEntity()).toList(),
    );
  }
}

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
