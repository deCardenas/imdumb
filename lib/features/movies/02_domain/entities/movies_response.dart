import 'package:imdumb/features/movies/02_domain/entities/movie.dart';

final class MoviesResponseEntity {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  const MoviesResponseEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
