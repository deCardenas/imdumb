import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:imdumb/features/movies/01_presentation/notifiers/favorite_movies_notifier.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/movie_vertical_card.dart';
import 'package:imdumb/routes/app_router.dart';

final class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(favoriteMoviesProvider);
    return movies.when(
      data: (data) => data.isEmpty
          ? Center(child: Text('Aun no has agregado una película favorita.'))
          : GridView.builder(
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => MovieVerticalCard(
                key: Key(index.toString()),
                movie: data[index],
                showFavoriteButton: true,
                onTap: () =>
                    context.push(MovieDetailRoute(id: data[index].id).location),
                onFavoriteTap: () => ref
                    .read(favoriteMoviesProvider.notifier)
                    .removeFavorite(index),
              ),
            ),
      error: (_, _) => Center(
        child: Text(
          'Error al cargar películas',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
