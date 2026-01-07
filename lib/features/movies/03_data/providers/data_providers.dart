import 'package:hive/hive.dart';
import 'package:imdumb/core/providers/core_providers.dart';
import 'package:imdumb/features/movies/03_data/data_sources/i_movies_data_source.dart';
import 'package:imdumb/features/movies/03_data/data_sources/movies_remote_data_source.dart';
import 'package:imdumb/features/movies/03_data/data_stores/favorite_data_store.dart';
import 'package:imdumb/features/movies/03_data/data_stores/i_favorite_data_store.dart';
import 'package:imdumb/features/movies/03_data/models/favorite_movie_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_providers.g.dart';

@Riverpod(keepAlive: true)
IMoviesDataSource moviesRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return MoviesRemoteDataSource(apiClient);
}

@Riverpod(keepAlive: true)
Box<FavoriteMovieHiveModel> favoritesBox(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true)
IFavoriteDataStore favoriteDataStore(Ref ref) {
  final box = ref.read(favoritesBoxProvider);
  return FavoriteDataStore(box);
}
