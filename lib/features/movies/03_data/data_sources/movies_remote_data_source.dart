import 'package:imdumb/features/movies/03_data/data_sources/base_remote_data_source.dart';
import 'package:imdumb/features/movies/03_data/data_sources/i_movies_data_source.dart';
import 'package:imdumb/features/movies/03_data/models/credits_response.dart';
import 'package:imdumb/features/movies/03_data/models/genres_response.dart';
import 'package:imdumb/features/movies/03_data/models/images_response.dart';
import 'package:imdumb/features/movies/03_data/models/movie_detail_model.dart';
import 'package:imdumb/features/movies/03_data/models/movies_responde.dart';

final class MoviesRemoteDataSource extends BaseRemoteDataSource
    implements IMoviesDataSource {
  const MoviesRemoteDataSource(super.apiClient);

  @override
  Future<List<GenreModel>> getGenres() async {
    final response = await apiClient.get(
      '/genre/movie/list',
      queryParameters: {'api_key': tmdbApiKey, 'language': 'es'},
    );

    final data = GenresResponse.fromJson(response.data);
    return data.genres;
  }

  @override
  Future<MoviesResponse> getMoviesByGenre(int genreId, int page) async {
    final response = await apiClient.get(
      '/discover/movie',
      queryParameters: {
        'api_key': tmdbApiKey,
        'with_genres': genreId,
        'page': page,
        'language': 'es',
      },
    );
    final data = MoviesResponse.fromJson(response.data);
    return data;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await apiClient.get(
      '/movie/$movieId',
      queryParameters: {'api_key': tmdbApiKey, 'language': 'es'},
    );
    final data = MovieDetailModel.fromJson(response.data);
    return Future.value(data);
  }

  @override
  Future<ImagesResponse> getMovieImages(int movieId) async {
    final response = await apiClient.get(
      '/movie/$movieId/images',
      queryParameters: {'api_key': tmdbApiKey, 'language': 'es'},
    );
    final data = ImagesResponse.fromJson(response.data);
    return Future.value(data);
  }

  @override
  Future<CreditsResponse> getMovieCredits(int movieId) async {
    final response = await apiClient.get(
      '/movie/$movieId/credits',
      queryParameters: {'api_key': tmdbApiKey, 'language': 'es'},
    );
    final data = CreditsResponse.fromJson(response.data);
    return Future.value(data);
  }
}
