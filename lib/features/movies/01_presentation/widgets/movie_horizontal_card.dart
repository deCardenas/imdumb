import 'package:flutter/material.dart';
import 'package:imdumb/core/constants/api_constants.dart';
import 'package:imdumb/features/movies/01_presentation/widgets/image_wrapper.dart';
import 'package:imdumb/features/movies/02_domain/entities/movie.dart';

class MovieHorizontalCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;
  final bool showFavoriteButton;
  final VoidCallback? onFavoriteTap;
  const MovieHorizontalCard({
    super.key,
    required this.movie,
    this.onTap,
    this.showFavoriteButton = false,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(8.0),
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
        child: Row(
          spacing: 16,
          children: [
            Stack(
              children: [
                Container(
                  color: colorScheme.surfaceContainerHighest,
                  width: 140,
                  alignment: Alignment.center,
                  child: ImageWrapper(
                    width: double.maxFinite,
                    url: ApiConstants.theMovieDbImageBaseUrl,
                    imagePath: movie.posterPath,
                    defaultIcon: Icons.movie_outlined,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
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
                if (showFavoriteButton)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: IconButton(
                      onPressed: onFavoriteTap,
                      icon: Icon(
                        movie.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: colorScheme.surfaceContainerHighest,
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: Theme.of(
                          context,
                        ).textTheme.titleLarge!.fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        movie.overview,
                        maxLines: 6,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
