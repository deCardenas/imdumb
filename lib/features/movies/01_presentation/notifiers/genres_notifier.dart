import 'package:imdumb/core/errors/exceptions.dart';
import 'package:imdumb/core/errors/failures.dart';
import 'package:imdumb/features/movies/01_presentation/notifiers/states.dart';
import 'package:imdumb/features/movies/02_domain/entities/genre.dart';
import 'package:imdumb/features/movies/02_domain/providers/domain_providers.dart';
import 'package:imdumb/features/movies/02_domain/use_cases/get_genres_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'genres_notifier.g.dart';

@riverpod
class GenresNotifier extends _$GenresNotifier {
  late final GetGenresUseCase _useCase;

  @override
  AbstractState<List<Genre>> build() {
    _useCase = ref.read(getGenresUseCaseProvider);
    return const InitialState();
  }

  Future<void> loadGenres() async {
    state = const LoadingState();

    try {
      final genres = await _useCase();
      state = SuccessState(genres);
    } catch (e) {
      if (e is AppException) {
        switch (e.runtimeType) {
          case const (NotAuthorizedException):
            state = const FailureState(NotAuthorizedFailure());
          case const (ConnectionServerException):
            state = const FailureState(NonConnectionFailure());
          default:
            state = FailureState(ConnectionServerFailure(e.message));
        }
      }
    }
  }
}
