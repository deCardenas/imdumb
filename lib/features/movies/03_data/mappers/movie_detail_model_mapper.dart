import 'package:imdumb/features/movies/02_domain/entities/movie_detail.dart';
import 'package:imdumb/features/movies/03_data/mappers/genre_model_mapper.dart';
import 'package:imdumb/features/movies/03_data/models/movie_detail_model.dart';

extension MovieDetailModelMapper on MovieDetailModel {
  MovieDetail toEntity() {
    return MovieDetail(
      id: id,
      title: title,
      overview: overview,
      releaseDate: releaseDate,
      runtime: runtime,
      genres: genres.map((genre) => genre.toEntity()).toList(),
      posterPath: posterPath,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
      adult: adult,
      budget: budget,
      homepage: homepage,
      imdbId: imdbId,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      popularity: popularity,
      revenue: revenue,
      status: status,
      tagline: tagline,
      video: video,
    );
  }
}
