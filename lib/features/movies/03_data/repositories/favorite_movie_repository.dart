import 'package:imdumb/features/movies/02_domain/entities/movie.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_favorite_movie_repository.dart';
import 'package:imdumb/features/movies/03_data/data_stores/i_favorite_data_store.dart';
import 'package:imdumb/features/movies/03_data/mappers/movie_model_mapper.dart';

final class FavoriteMovieRepository implements IFavoriteMovieRepository {
  final IFavoriteDataStore _moviesDataSource;

  const FavoriteMovieRepository(this._moviesDataSource);

  @override
  Future<void> add(Movie movie) {
    return _moviesDataSource.add(movie.toHive());
  }

  @override
  Future<void> remove(int id) {
    return _moviesDataSource.remove(id);
  }

  @override
  List<Movie> getAll() {
    return _moviesDataSource.getAll().map((e) => e.toEntity()).toList();
  }

  @override
  bool isFavorite(int id) {
    return _moviesDataSource.isFavorite(id);
  }
}
