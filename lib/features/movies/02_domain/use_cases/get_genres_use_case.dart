import 'package:imdumb/features/movies/02_domain/entities/genre.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

final class GetGenresUseCase {
  final IMoviesRepository repository;

  const GetGenresUseCase(this.repository);

  Future<List<Genre>> call() {
    return repository.getGenres();
  }
}
