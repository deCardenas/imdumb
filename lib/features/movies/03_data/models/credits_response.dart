final class CreditsResponse {
  final int? id;
  final List<PersonModel>? cast;
  final List<PersonModel>? crew;

  const CreditsResponse({this.id, this.cast, this.crew});

  factory CreditsResponse.fromJson(Map<String, dynamic> json) =>
      CreditsResponse(
        id: json['id'] as int?,
        cast: (json['cast'] as List<dynamic>?)
            ?.map((e) => PersonModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        crew: (json['crew'] as List<dynamic>?)
            ?.map((e) => PersonModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'cast': cast?.map((e) => e.toJson()).toList(),
    'crew': crew?.map((e) => e.toJson()).toList(),
  };
}

final class PersonModel {
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

  const PersonModel({
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

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
    adult: json['adult'] as bool?,
    gender: json['gender'] as int?,
    id: json['id'] as int?,
    knownForDepartment: json['known_for_department'] as String?,
    name: json['name'] as String?,
    originalName: json['original_name'] as String?,
    popularity: (json['popularity'] as double?),
    profilePath: json['profile_path'] as String?,
    castId: json['cast_id'] as int?,
    character: json['character'] as String?,
    creditId: json['credit_id'] as String?,
    order: json['order'] as int?,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['cast_id'] = castId;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['order'] = order;
    return data;
  }
}
