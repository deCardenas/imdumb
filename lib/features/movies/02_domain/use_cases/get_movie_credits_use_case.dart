import 'package:imdumb/features/movies/02_domain/entities/credits_response.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

final class GetMovieCreditsUseCase {
  final IMoviesRepository repository;

  const GetMovieCreditsUseCase(this.repository);

  Future<CreditsResponseEntity> call(int movieId) {
    return repository.getMovieCredits(movieId);
  }
}
