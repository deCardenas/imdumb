import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imdumb/core/constants/api_constants.dart';
import 'package:imdumb/features/movies/01_presentation/notifiers/movie_detail_notifier.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/actor_card.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/comment_dialog_content.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/image_wrapper.dart';
import 'package:imdumb/features/movies/02_domain/entities/credits_response.dart';
import 'package:imdumb/features/movies/02_domain/entities/images_response.dart';
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
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.only(
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0),
                      ),
                      child: ImageWrapper(
                        url: ApiConstants.theMovieDbImageBaseUrl,
                        imagePath: data.movieDetail.backdropPath,
                        defaultIcon: Icons.movie_outlined,
                        width: double.maxFinite,
                        height: 300,
                      ),
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
                    bottom: 16.0,
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
                  _ImagesSection(images: data.images!),
                if (data.actors?.isNotEmpty == true) ...[
                  _ActorsSection(actors: data.actors!),
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
        loading: () => Center(child: const CircularProgressIndicator()),
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

class _ImagesSection extends StatefulWidget {
  final List<TMDBImageEntity> images;
  const _ImagesSection({required this.images});

  @override
  State<_ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<_ImagesSection> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: widget.images.length,
          itemBuilder: (context, index, realIndex) => ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: ImageWrapper(
              url: ApiConstants.theMovieDbImageOriginalBaseUrl,
              imagePath: widget.images[index].filePath,
              defaultIcon: Icons.movie_outlined,
            ),
          ),
          options: CarouselOptions(
            height: 170,
            pageSnapping: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() => _currentPage = index);
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: widget.images
              .asMap()
              .entries
              .map(
                (e) => Container(
                  height: 8,
                  width: 8,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withAlpha(_currentPage == e.key ? 230 : 102),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ActorsSection extends StatelessWidget {
  final List<PersonEntity> actors;
  const _ActorsSection({required this.actors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          child: Text(
            'Actores',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: actors.length,
            itemBuilder: (context, index) => ActorCard(actor: actors[index]),
          ),
        ),
      ],
    );
  }
}
