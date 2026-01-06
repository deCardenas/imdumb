import 'package:imdumb/features/movies/02_domain/entities/movie.dart';
import 'package:imdumb/features/movies/02_domain/entities/movies_response.dart';
import 'package:imdumb/features/movies/03_data/models/movies_responde.dart';

extension MoviesResponseModelMapper on MoviesResponse {
  MoviesResponseEntity toEntity() {
    return MoviesResponseEntity(
      page: page,
      results: results.map((movie) => movie.toEntity()).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}

extension MovieModelMapper on MovieModel {
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
      genreIds: genreIds,
      releaseDate: releaseDate,
    );
  }
}
