import 'package:imdumb/features/movies/03_data/models/favorite_movie_model.dart';

abstract interface class IFavoriteDataStore {
  Future<void> add(FavoriteMovieHiveModel movie);
  Future<void> remove(int id);
  List<FavoriteMovieHiveModel> getAll();
  bool isFavorite(int id);
}
