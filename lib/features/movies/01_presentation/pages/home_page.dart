import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imdumb/features/movies/01_presentation/notifiers/genres_notifier.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/genre_row.dart';

final class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final genres = ref.watch(genresProvider);

    return genres.when(
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => data.length != index
            ? GenreRow(genre: data[index])
            : SizedBox(height: 80),
      ),
      error: (error, stackTrace) => Center(
        child: Text(
          'Error: $error',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
