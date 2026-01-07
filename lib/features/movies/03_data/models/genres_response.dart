///   SOLID:
/// - SRP (Single Responsibility):
///   Representa y serializa únicamente la respuesta de géneros desde la API.
final class GenresResponse {
  final List<GenreModel> genres;

  const GenresResponse({required this.genres});

  factory GenresResponse.fromJson(Map<String, dynamic> json) {
    final genresJson = json['genres'] as List<dynamic>;
    final genresList = genresJson
        .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return GenresResponse(genres: genresList);
  }

  Map<String, dynamic> toJson() {
    return {'genres': genres.map((e) => e.toJson()).toList()};
  }
}

final class GenreModel {
  final int id;
  final String name;

  const GenreModel({required this.id, required this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(id: json['id'] as int, name: json['name'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
