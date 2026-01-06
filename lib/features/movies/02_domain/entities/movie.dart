final class Movie {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
    required this.releaseDate,
  });

  String get year =>
      releaseDate.isNotEmpty ? releaseDate.split('-').first : 'N/A';
}
