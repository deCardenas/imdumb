import 'package:imdumb/features/movies/03_data/models/credits_response.dart';
import 'package:imdumb/features/movies/03_data/models/genres_response.dart';
import 'package:imdumb/features/movies/03_data/models/images_response.dart';
import 'package:imdumb/features/movies/03_data/models/movie_detail_model.dart';
import 'package:imdumb/features/movies/03_data/models/movies_responde.dart';

abstract interface class IMoviesDataSource {
  Future<List<GenreModel>> getGenres();

  Future<MoviesResponse> getMoviesByGenre(int genreId, int page);

  Future<MovieDetailModel> getMovieDetail(int movieId);

  Future<ImagesResponse> getMovieImages(int movieId);

  Future<CreditsResponse> getMovieCredits(int movieId);
}
