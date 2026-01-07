import 'package:imdumb/features/movies/02_domain/entities/movie.dart';

abstract interface class IFavoriteMovieRepository {
  Future<void> add(Movie movie);
  Future<void> remove(int id);
  List<Movie> getAll();
  bool isFavorite(int id);
}
