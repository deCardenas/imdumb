import 'package:imdumb/features/movies/02_domain/entities/movie.dart';
import 'package:imdumb/features/movies/02_domain/providers/domain_providers.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_favorite_movies_use_case.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/remove_favorite_movie_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_movies_notifier.g.dart';

@riverpod
class FavoriteMoviesNotifier extends _$FavoriteMoviesNotifier {
  late final GetFavoriteMoviesUseCase _getMovieList;
  late final RemoveFavoriteMovieUseCase _removeFavoriteMovie;

  @override
  Future<List<Movie>> build() async {
    _getMovieList = ref.read(getFavoriteMoviesUseCaseProvider);
    _removeFavoriteMovie = ref.read(removeFavoriteMovieUseCaseProvider);

    final data = _getMovieList();

    return data;
  }

  void removeFavorite(int index) async {
    await _removeFavoriteMovie(state.requireValue[index].id);
    state = AsyncData(_getMovieList());
  }
}
