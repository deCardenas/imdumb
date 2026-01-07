import 'package:hive/hive.dart';
import 'package:imdumb/features/movies/03_data/data_stores/i_favorite_data_store.dart';
import 'package:imdumb/features/movies/03_data/models/favorite_movie_model.dart';

final class FavoriteDataStore implements IFavoriteDataStore {
  final Box<FavoriteMovieHiveModel> _box;

  const FavoriteDataStore(this._box);

  @override
  Future<void> add(FavoriteMovieHiveModel movie) async {
    await _box.put(movie.id, movie);
  }

  @override
  Future<void> remove(int id) async {
    await _box.delete(id);
  }

  @override
  List<FavoriteMovieHiveModel> getAll() {
    return _box.values.toList();
  }

  @override
  bool isFavorite(int id) {
    return _box.containsKey(id);
  }
}
