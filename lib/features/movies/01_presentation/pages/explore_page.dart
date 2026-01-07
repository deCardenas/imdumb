import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:imdumb/core/services/app_preferences_service.dart';
import 'package:imdumb/features/movies/01_presentation/notifiers/movie_list_notifier.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/loaders.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/movie_horizontal_card.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/movie_vertical_card.dart';
import 'package:imdumb/routes/app_router.dart';

enum MoviesLayout { horizontal, vertical }

extension MoviesLayoutX on MoviesLayout {
  String get value {
    switch (this) {
      case MoviesLayout.horizontal:
        return 'horizontal';
      case MoviesLayout.vertical:
        return 'vertical';
    }
  }

  static MoviesLayout fromString(String value) {
    switch (value) {
      case 'horizontal':
        return MoviesLayout.horizontal;
      case 'vertical':
        return MoviesLayout.vertical;
      default:
        return MoviesLayout.vertical;
    }
  }
}

enum MovieList { nowPlaying, popular, topRated, upcoming }

extension MovieListX on MovieList {
  String get value {
    switch (this) {
      case MovieList.nowPlaying:
        return 'now_playing';
      case MovieList.popular:
        return 'popular';
      case MovieList.topRated:
        return 'top_rated';
      case MovieList.upcoming:
        return 'upcoming';
    }
  }

  String get label {
    switch (this) {
      case MovieList.nowPlaying:
        return 'En cartelera';
      case MovieList.popular:
        return 'Populares';
      case MovieList.topRated:
        return 'Más valorados';
      case MovieList.upcoming:
        return 'Próximos lanzamientos';
    }
  }

  static MovieList fromString(String value) {
    switch (value) {
      case 'now_playing':
        return MovieList.nowPlaying;
      case 'popular':
        return MovieList.popular;
      case 'top_rated':
        return MovieList.topRated;
      case 'upcoming':
        return MovieList.upcoming;
      default:
        return MovieList.nowPlaying;
    }
  }
}

final class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  late MoviesLayout movieLayout;
  late MovieList category;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    movieLayout = MoviesLayoutX.fromString(
      AppPreferencesService.instance.movieLayout!,
    );
    category = MovieListX.fromString(AppPreferencesService.instance.movieList!);
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final position = _scrollController.position;

    if (position.pixels >= position.maxScrollExtent - 200) {
      final moviesPage = ref.read(movieListProvider(category.value));
      if (moviesPage.requireValue.paginationError == null) {
        ref.read(movieListProvider(category.value).notifier).loadMore();
      } else {
        ref.read(movieListProvider(category.value).notifier).retryPagination();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(movieListProvider(category.value));
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 24,
            children: [
              DropdownButton<MovieList>(
                value: category,
                items: MovieList.values
                    .map(
                      (e) => DropdownMenuItem(value: e, child: Text(e.label)),
                    )
                    .toList(),
                onChanged: (newCategory) {
                  if (newCategory == null) return;
                  AppPreferencesService.instance.movieList = newCategory.value;
                  setState(() => category = newCategory);
                },
              ),
              SegmentedButton<MoviesLayout>(
                style: SegmentedButton.styleFrom(
                  backgroundColor: colorScheme.surfaceContainer,
                  selectedBackgroundColor: colorScheme.surfaceContainerHighest,
                ),
                segments: <ButtonSegment<MoviesLayout>>[
                  ButtonSegment(
                    value: MoviesLayout.horizontal,
                    icon: Icon(Icons.view_agenda),
                  ),
                  ButtonSegment(
                    value: MoviesLayout.vertical,
                    icon: Icon(Icons.view_week),
                  ),
                ],
                selected: {movieLayout},
                onSelectionChanged: (newSelection) {
                  AppPreferencesService.instance.movieLayout =
                      newSelection.first.value;
                  setState(() => movieLayout = newSelection.first);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: movies.when(
            data: (data) {
              switch (movieLayout) {
                case MoviesLayout.horizontal:
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: data.movies.length,
                    itemBuilder: (context, index) => MovieHorizontalCard(
                      movie: data.movies[index],
                      showFavoriteButton: true,
                      onTap: () => context.push(
                        MovieDetailRoute(id: data.movies[index].id).location,
                      ),
                      onFavoriteTap: () => ref
                          .read(movieListProvider(category.value).notifier)
                          .addRemoveFavorite(index),
                    ),
                  );
                case MoviesLayout.vertical:
                  return GridView.builder(
                    controller: _scrollController,
                    itemCount: data.movies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) => MovieVerticalCard(
                      movie: data.movies[index],
                      showFavoriteButton: true,
                      onTap: () => context.push(
                        MovieDetailRoute(id: data.movies[index].id).location,
                      ),
                      onFavoriteTap: () => ref
                          .read(movieListProvider(category.value).notifier)
                          .addRemoveFavorite(index),
                    ),
                  );
              }
            },
            error: (_, _) => Center(
              child: Text(
                'Error al cargar películas',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            loading: () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => MovieVerticalCardLoader(),
            ),
          ),
        ),
      ],
    );
  }
}
