import 'package:imdumb/features/movies/02_domain/entities/credits_response.dart';
import 'package:imdumb/features/movies/02_domain/entities/genre.dart';
import 'package:imdumb/features/movies/02_domain/entities/images_response.dart';
import 'package:imdumb/features/movies/02_domain/entities/movie_detail.dart';
import 'package:imdumb/features/movies/02_domain/entities/movies_response.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';
import 'package:imdumb/features/movies/03_data/data_sources/i_movies_data_source.dart';
import 'package:imdumb/features/movies/03_data/mappers/credits_response_mapper.dart';
import 'package:imdumb/features/movies/03_data/mappers/genre_model_mapper.dart';
import 'package:imdumb/features/movies/03_data/mappers/images_response_mapper.dart';
import 'package:imdumb/features/movies/03_data/mappers/movie_detail_model_mapper.dart';
import 'package:imdumb/features/movies/03_data/mappers/movie_model_mapper.dart';

final class MoviesRepository implements IMoviesRepository {
  final IMoviesDataSource remoteDataSource;

  const MoviesRepository(this.remoteDataSource);

  @override
  Future<List<Genre>> getGenres() async {
    final genreList = await remoteDataSource.getGenres();

    return genreList.map((genre) => genre.toEntity()).toList();
  }

  @override
  Future<MoviesResponseEntity> getMoviesByGenre(int genreId, int page) async {
    final moviesResponse = await remoteDataSource.getMoviesByGenre(
      genreId,
      page,
    );
    return moviesResponse.toEntity();
  }

  @override
  Future<MovieDetail> getMovieDetail(int movieId) async {
    final movieDetail = await remoteDataSource.getMovieDetail(movieId);
    return movieDetail.toEntity();
  }

  @override
  Future<ImagesResponseEntity> getMovieImages(int movieId) async {
    final imagesResponse = await remoteDataSource.getMovieImages(movieId);
    return imagesResponse.toEntity();
  }

  @override
  Future<CreditsResponseEntity> getMovieCredits(int movieId) async {
    final creditsResponse = await remoteDataSource.getMovieCredits(movieId);
    return creditsResponse.toEntity();
  }
}
