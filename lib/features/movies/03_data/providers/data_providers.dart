import 'package:imdumb/core/providers/core_providers.dart';
import 'package:imdumb/features/movies/03_data/data_sources/i_movies_data_source.dart';
import 'package:imdumb/features/movies/03_data/data_sources/movies_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_providers.g.dart';

@Riverpod(keepAlive: true)
IMoviesDataSource moviesRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return MoviesRemoteDataSource(apiClient);
}
