import 'package:flutter/foundation.dart';
import 'package:imdumb/core/client/api_client.dart';

abstract class BaseRemoteDataSource {
  final ApiClient _apiClient;

  const BaseRemoteDataSource(this._apiClient);

  @protected
  ApiClient get apiClient => _apiClient;

  @protected
  String get tmdbApiKey => kDebugMode
      ? '0777a4784320df99f22cfb59888f5422'
      : String.fromEnvironment('TMDB_KEY');
}
