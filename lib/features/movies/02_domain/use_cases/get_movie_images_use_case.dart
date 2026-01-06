import 'package:imdumb/features/movies/02_domain/entities/images_response.dart';
import 'package:imdumb/features/movies/02_domain/repositories/i_movies_repository.dart';

final class GetMovieImagesUseCase {
  final IMoviesRepository repository;

  const GetMovieImagesUseCase(this.repository);

  Future<ImagesResponseEntity> call(int movieId) {
    return repository.getMovieImages(movieId);
  }
}
