import 'package:imdumb/features/movies/02_domain/entities/credits_response.dart';
import 'package:imdumb/features/movies/02_domain/entities/images_response.dart';
import 'package:imdumb/features/movies/02_domain/entities/movie_detail.dart';
import 'package:imdumb/features/movies/02_domain/providers/domain_providers.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_movie_credits_use_case.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_movie_detail_use_case.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_movie_images_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_detail_notifier.g.dart';

@riverpod
class MoviesDetailNotifier extends _$MoviesDetailNotifier {
  late final GetMovieDetailUseCase _getMovieDetail;
  late final GetMovieImagesUseCase _getMovieImages;
  late final GetMovieCreditsUseCase _getMovieCredits;

  @override
  Future<MovieDetailPage> build(int movieId) async {
    _getMovieDetail = ref.read(getMovieDetailUseCaseProvider);
    _getMovieImages = ref.read(getMovieImagesUseCaseProvider);
    _getMovieCredits = ref.read(getMovieCreditsUseCaseProvider);
    final data = await _getMovieDetail(movieId);

    return MovieDetailPage(movieDetail: data);
  }

  Future<void> loadAdditionalData() async {
    final current = state.value;
    if (current == null) return;

    try {
      final imagesFuture = _getMovieImages(movieId);
      final creditsFuture = _getMovieCredits(movieId);

      final results = await Future.wait([imagesFuture, creditsFuture]);

      final imagesResponse = results[0] as ImagesResponseEntity;
      final creditsResponse = results[1] as CreditsResponseEntity;

      state = AsyncData(
        current.copyWith(
          images: imagesResponse.backdrops,
          actors: creditsResponse.cast,
        ),
      );
    } catch (e) {
      state = AsyncData(
        current.copyWith(paginationError: 'Error al cargar datos adicionales'),
      );
    }
  }
}

final class MovieDetailPage {
  final MovieDetail movieDetail;
  final List<TMDBImageEntity>? images;
  final List<PersonEntity>? actors;
  final String? paginationError;

  const MovieDetailPage({
    required this.movieDetail,
    this.images,
    this.actors,
    this.paginationError,
  });

  MovieDetailPage copyWith({
    MovieDetail? movieDetail,
    List<TMDBImageEntity>? images,
    List<PersonEntity>? actors,
    String? paginationError,
  }) {
    return MovieDetailPage(
      movieDetail: movieDetail ?? this.movieDetail,
      images: images ?? this.images,
      actors: actors ?? this.actors,
      paginationError: paginationError,
    );
  }
}
