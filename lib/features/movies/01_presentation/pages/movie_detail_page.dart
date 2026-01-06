import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imdumb/core/constants/api_constants.dart';
import 'package:imdumb/features/movies/01_presentation/notifiers/movie_detail_notifier.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/image_wrapper.dart';
import 'package:imdumb/features/shared/01_presentation/pages/base_page.dart';

final class MovieDetailPage extends ConsumerWidget {
  final int movieId;
  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(moviesDetailProvider(movieId));
    ref.listen(moviesDetailProvider(movieId), (previous, next) {
      if (next.hasValue && next.requireValue.images == null) {
        ref.read(moviesDetailProvider(movieId).notifier).loadAdditionalData();
      }
    });
    return BasePage(
      safeArea: false,
      child: movie.when(
        data: (data) => Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    ImageWrapper(
                      url: ApiConstants.theMovieDbImageBaseUrl,
                      imagePath: data.movieDetail.backdropPath,
                      defaultIcon: Icons.movie_outlined,
                      width: double.maxFinite,
                      height: 300,
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      iconTheme: Theme.of(context).iconTheme.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 16,
                        children: [
                          Text(
                            data.movieDetail.year,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            data.movieDetail.duration,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                data.movieDetail.voteAverage.toStringAsFixed(1),
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 4),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                            ],
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 16,
                        children: data.movieDetail.genres
                            .map(
                              (genre) => Chip(
                                label: Text(genre.name),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    data.movieDetail.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 8.0,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    data.movieDetail.overview,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                if (data.images?.isNotEmpty == true)
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.images!.length,
                      itemBuilder: (context, index) {
                        final image = data.images![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: ImageWrapper(
                              url: ApiConstants.theMovieDbImageOriginalBaseUrl,
                              imagePath: image.filePath,
                              defaultIcon: Icons.movie_outlined,
                              width: 240,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (data.actors?.isNotEmpty == true) ...[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      'Actores',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.actors!.length,

                      itemBuilder: (context, index) => Container(
                        width: 160,
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(16.0),
                              child: ImageWrapper(
                                url: ApiConstants.theMovieDbImageBaseUrl,
                                imagePath: data.actors![index].profilePath,
                                defaultIcon: Icons.person_outline,
                                height: 200,
                              ),
                            ),
                            Text(data.actors![index].name ?? '-', maxLines: 2),
                            Text(
                              data.actors![index].character ?? '-',
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 80),
              ],
            ),
            Positioned(
              bottom: 24,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () => showModal(context, data.movieDetail.overview),
                child: Text('Recomendar'),
              ),
            ),
          ],
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }

  void showModal(BuildContext context, String overview) async {
    final colorScheme = Theme.of(context).colorScheme;
    final textController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: colorScheme.primaryContainer,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Recomendar',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          content: CommentDialogContent(
            overview: overview,
            textController: textController,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CANCELAR'),
            ),
            FilledButton(
              onPressed: () {
                final comment = textController.text.trim();
                if (comment.isEmpty) return;

                Navigator.of(context).pop();

                if (!context.mounted) return;

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    backgroundColor: colorScheme.primaryContainer,
                    title: const Text('Comentario enviado'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        const Text('Tu comentario:'),
                        Text(
                          comment,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const Text('Gracias por compartir tu opinión 🎬'),
                      ],
                    ),
                  ),
                );
              },
              child: const Text('ENVIAR'),
            ),
          ],
        );
      },
    );
  }
}

class CommentDialogContent extends StatelessWidget {
  final String overview;
  final TextEditingController textController;
  const CommentDialogContent({
    super.key,
    required this.overview,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overview,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.4,
            color: colorScheme.onSurface.withAlpha(200),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Tu comentario',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.outline.withAlpha(100)),
          ),
          child: TextField(
            controller: textController,
            maxLines: 4,
            cursorColor: colorScheme.primary,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Escribe tu comentario…',
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withAlpha(120),
              ),
              contentPadding: const EdgeInsets.all(12),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
