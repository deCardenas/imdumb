final class MoviesResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => MoviesResponse(
    page: json['page'] as int,
    results: (json['results'] as List)
        .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
  );
}

final class MovieModel {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    adult: json['adult'] as bool,
    backdropPath: json['backdrop_path'] as String?,
    genreIds: List<int>.from(json['genre_ids']),
    id: json['id'] as int,
    originalLanguage: json['original_language'] as String,
    originalTitle: json['original_title'] as String,
    overview: json['overview'] as String,
    popularity: (json['popularity'] as double),
    posterPath: json['poster_path'] as String?,
    releaseDate: json['release_date'] as String,
    title: json['title'] as String,
    video: json['video'] as bool,
    voteAverage: (json['vote_average'] as double),
    voteCount: json['vote_count'] as int,
  );
}
