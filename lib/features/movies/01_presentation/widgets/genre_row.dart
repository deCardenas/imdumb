import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:imdumb/features/movies/01_presentation/notifiers/movies_notifier.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/genre_chip.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/loaders.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/movie_vertical_card.dart';
import 'package:imdumb/features/movies/02_domain/entities/genre.dart';
import 'package:imdumb/routes/app_router.dart';

class GenreRow extends ConsumerStatefulWidget {
  final Genre genre;

  const GenreRow({super.key, required this.genre});

  @override
  ConsumerState<GenreRow> createState() => _GenreRowState();
}

class _GenreRowState extends ConsumerState<GenreRow> {
  int get genreId => widget.genre.id;

  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
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
      final moviesPage = ref.read(moviesByGenreProvider(genreId));
      if (moviesPage.requireValue.isLoadingMore) return;
      if (moviesPage.requireValue.paginationError == null) {
        ref.read(moviesByGenreProvider(genreId).notifier).loadMore();
      } else {
        ref.read(moviesByGenreProvider(genreId).notifier).retryPagination();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final moviesPage = ref.watch(moviesByGenreProvider(genreId));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenreChip(genre: widget.genre),
        SizedBox(
          height: 400, // altura de la fila horizontal
          child: moviesPage.when(
            data: (data) => ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: data.movies.length,
              itemBuilder: (context, index) => MovieVerticalCard(
                movie: data.movies[index],
                onTap: () => context.push(
                  MovieDetailRoute(id: data.movies[index].id).location,
                ),
              ),
            ),
            error: (_, __) => Center(
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
        // Aquí podrías agregar una fila de películas relacionadas con este género
      ],
    );
  }
}
