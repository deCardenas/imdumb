import 'package:dio/dio.dart';
import 'package:imdumb/core/client/api_client.dart';
import 'package:imdumb/core/client/dio_client.dart';
import 'package:imdumb/core/constants/api_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.theMovieDbBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  return dio;
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  final dioInstance = ref.read(dioProvider);
  return DioClient(dioInstance);
}
