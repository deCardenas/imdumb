import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imdumb/features/movies/01_presentation/notifiers/genres_notifier.dart';
import 'package:imdumb/features/movies/01_presentation/notifiers/states.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/genre_row.dart';
import 'package:imdumb/features/movies/02_domain/entities/genre.dart';

final class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(genresProvider.notifier).loadGenres();
    });
  }

  @override
  Widget build(BuildContext context) {
    final genres = ref.watch(genresProvider);

    return switch (genres) {
      SuccessState<List<Genre>>(:final data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => data.length != index
            ? GenreRow(genre: data[index])
            : SizedBox(height: 80),
      ),
      LoadingState() => Center(child: CircularProgressIndicator()),
      FailureState(:final failure) => Center(
        child: Text(
          'Error: ${failure.message}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      _ => const SizedBox.shrink(),
    };
  }
}
