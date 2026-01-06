import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:imdumb/core/client/api_client.dart';
import 'package:imdumb/core/client/api_response.dart';
import 'package:imdumb/core/constants/api_constants.dart';
import 'package:imdumb/core/errors/exceptions.dart';

final class DioClient implements ApiClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options
      ..baseUrl = ApiConstants.theMovieDbBaseUrl
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
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
    await _request(
      _dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
    );
    final response = await _dio.delete(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    return _toApiResponse(response);
  }

  Future<Response<T>> _request<T>(Future<Response<T>> request) async {
    Response response;
    try {
      response = await request;
      return response as Response<T>;
    } on DioException catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack, fatal: false);
      if (e.type == DioExceptionType.badResponse) {
        switch (e.response?.statusCode) {
          case 405:
            throw const NotAuthorizedException();
        }
      } else if (e.message == 'ConnectionServerFailure') {
        throw const ConnectionServerException();
      }
      rethrow;
    }
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
