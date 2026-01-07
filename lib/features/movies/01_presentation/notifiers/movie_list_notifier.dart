import 'package:imdumb/features/movies/01_presentation/notifiers/movies_notifier.dart';
import 'package:imdumb/features/movies/02_domain/providers/domain_providers.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/add_favorite_movie_use_case.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_movie_list_use_case.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/remove_favorite_movie_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_list_notifier.g.dart';

@riverpod
class MovieListNotifier extends _$MovieListNotifier {
  int _page = 1;
  late final GetMovieListUseCase _getMovieList;
  late final AddFavoriteMovieUseCase _addFavoriteMovie;
  late final RemoveFavoriteMovieUseCase _removeFavoriteMovie;

  @override
  Future<MoviesPage> build(String list) async {
    _getMovieList = ref.read(getMovieListUseCaseProvider);
    _addFavoriteMovie = ref.read(addFavoriteMovieUseCaseProvider);
    _removeFavoriteMovie = ref.read(removeFavoriteMovieUseCaseProvider);

    final data = await _getMovieList(list, _page);

    return MoviesPage(movies: data.results, hasMore: _page < data.totalPages);
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(
      current.copyWith(isLoadingMore: true, paginationError: null),
    );

    final nextPage = _page + 1;

    try {
      final data = await _getMovieList(list, nextPage);
      _page = nextPage;

      state = AsyncData(
        current.copyWith(
          movies: [...current.movies, ...data.results],
          hasMore: _page < data.totalPages,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      state = AsyncData(
        current.copyWith(
          isLoadingMore: false,
          paginationError: 'Error al cargar más películas',
        ),
      );
    }
  }

  void retryPagination() {
    state = AsyncData(state.requireValue.copyWith(paginationError: null));
    loadMore();
  }

  void addRemoveFavorite(int index) async {
    final movies = [...state.value!.movies];
    if (movies[index].isFavorite) {
      await _removeFavoriteMovie(index);
      movies[index] = movies[index].copyWith(false);
    } else {
      await _addFavoriteMovie(movies[index]);
      movies[index] = movies[index].copyWith(true);
    }
    state = AsyncData(state.requireValue.copyWith(movies: movies));
  }
}
