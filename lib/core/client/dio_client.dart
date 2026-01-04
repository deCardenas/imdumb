import 'package:dio/dio.dart';
import 'package:imdumb/core/client/api_client.dart';
import 'package:imdumb/core/client/api_response.dart';
import 'package:imdumb/core/constants/api_constants.dart';

class DioClient implements ApiClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options
      ..baseUrl = ApiConstants.theMovieDbBaseUrl
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  @override
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return _toApiResponse(response);
  }

  @override
  Future<ApiResponse> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return _toApiResponse(response);
  }

  @override
  Future<ApiResponse> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return _toApiResponse(response);
  }

  @override
  Future<ApiResponse> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.delete(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return _toApiResponse(response);
  }

  ApiResponse _toApiResponse(Response response) {
    return ApiResponse(
      statusCode: response.statusCode ?? 0,
      statusMessage: response.statusMessage ?? '',
      data: response.data,
      headers: Map<String, dynamic>.from(response.headers.map),
    );
  }
}
