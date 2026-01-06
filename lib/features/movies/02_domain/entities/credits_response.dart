final class CreditsResponseEntity {
  final int? id;
  final List<PersonEntity>? cast;
  final List<PersonEntity>? crew;

  const CreditsResponseEntity({this.id, this.cast, this.crew});
}

final class PersonEntity {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;

  const PersonEntity({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });
}
