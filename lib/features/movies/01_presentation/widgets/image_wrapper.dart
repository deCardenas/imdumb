import 'package:flutter/material.dart';

class ImageWrapper extends StatelessWidget {
  final String url;
  final String? imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final IconData defaultIcon;
  const ImageWrapper({
    super.key,
    required this.url,
    required this.imagePath,
    required this.defaultIcon,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      height: height,
      child: imagePath == null
          ? Icon(
              defaultIcon,
              size: 40,
              color: colorScheme.onSurface.withAlpha(120),
            )
          : Image.network(
              '$url$imagePath',
              fit: fit,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                  ? child
                  : Icon(
                      Icons.movie_outlined,
                      size: 40,
                      color: colorScheme.onSurface.withAlpha(120),
                    ),
              errorBuilder: (context, error, stackTrace) => Icon(
                defaultIcon,
                size: 40,
                color: colorScheme.onSurface.withAlpha(120),
              ),
            ),
    );
  }
}
