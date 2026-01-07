final class Movie {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final bool isFavorite;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.isFavorite,
  });

  String get year =>
      releaseDate.isNotEmpty ? releaseDate.split('-').first : 'N/A';

  Movie copyWith(bool isFavorite) => Movie(
    id: id,
    title: title,
    overview: overview,
    posterPath: posterPath,
    voteAverage: voteAverage,
    voteCount: voteCount,
    releaseDate: releaseDate,
    isFavorite: isFavorite,
  );
}
