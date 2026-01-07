import 'package:imdumb/features/movies/02_domain/entities/genre.dart';
import 'package:imdumb/features/movies/02_domain/providers/domain_providers.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_genres_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'genres_notifier.g.dart';

@riverpod
class GenresNotifier extends _$GenresNotifier {
  late final GetGenresUseCase _getGenres;

  @override
  Future<List<Genre>> build() {
    _getGenres = ref.read(getGenresUseCaseProvider);
    return _getGenres();
  }
}
