import 'package:imdumb/features/movies/02_domain/entities/credits_response.dart';
import 'package:imdumb/features/movies/02_domain/entities/genre.dart';
import 'package:imdumb/features/movies/02_domain/entities/images_response.dart';
import 'package:imdumb/features/movies/02_domain/entities/movie_detail.dart';
import 'package:imdumb/features/movies/02_domain/entities/movies_response.dart';

abstract interface class IMoviesRepository {
  Future<List<Genre>> getGenres();
  Future<MoviesResponseEntity> getMoviesByGenre(int genreId, int page);
  Future<MovieDetail> getMovieDetail(int movieId);
  Future<ImagesResponseEntity> getMovieImages(int movieId);
  Future<CreditsResponseEntity> getMovieCredits(int movieId);
}
