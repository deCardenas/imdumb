import 'package:imdumb/features/movies/02_domain/entities/movie.dart';
import 'package:imdumb/features/movies/02_domain/providers/domain_providers.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_movies_by_genre_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_notifier.g.dart';

@Riverpod(keepAlive: true)
class MoviesByGenreNotifier extends _$MoviesByGenreNotifier {
  int _page = 1;
  late final GetMoviesByGenreUseCase _getMoviesByGenre;

  @override
  Future<MoviesPage> build(int genreId) async {
    _getMoviesByGenre = ref.read(getMoviesByGenreUseCaseProvider);

    final data = await _getMoviesByGenre(genreId, _page);

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
      final data = await _getMoviesByGenre(genreId, nextPage);
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
}

final class MoviesPage {
  final List<Movie> movies;
  final bool hasMore;
  final bool isLoadingMore;
  final String? paginationError;

  const MoviesPage({
    required this.movies,
    required this.hasMore,
    this.isLoadingMore = false,
    this.paginationError,
  });

  MoviesPage copyWith({
    List<Movie>? movies,
    bool? hasMore,
    bool? isLoadingMore,
    String? paginationError,
  }) {
    return MoviesPage(
      movies: movies ?? this.movies,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      paginationError: paginationError,
    );
  }
}
