final class ImagesResponseEntity {
  final int? id;
  final List<TMDBImageEntity>? backdrops;
  final List<TMDBImageEntity>? logos;
  final List<TMDBImageEntity>? posters;

  const ImagesResponseEntity({
    this.id,
    this.backdrops,
    this.logos,
    this.posters,
  });
}

final class TMDBImageEntity {
  final double? aspectRatio;
  final int? height;
  final String? iso31661;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  const TMDBImageEntity({
    this.aspectRatio,
    this.height,
    this.iso31661,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });
}
