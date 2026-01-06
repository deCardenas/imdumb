import 'package:flutter/material.dart';
import 'package:imdumb/core/constants/api_constants.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/image_wrapper.dart';
import 'package:imdumb/features/movies/02_domain/entities/movie.dart';

class MovieVerticalCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;
  const MovieVerticalCard({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withAlpha(60),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Container(
              color: colorScheme.surfaceContainerHighest,
              alignment: Alignment.center,
              child: ImageWrapper(
                height: double.maxFinite,
                url: ApiConstants.theMovieDbImageBaseUrl,
                imagePath: movie.posterPath,
                defaultIcon: Icons.movie_outlined,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                movie.year,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  movie.title,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
