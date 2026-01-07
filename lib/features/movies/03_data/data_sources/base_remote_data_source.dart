import 'package:flutter/foundation.dart';
import 'package:imdumb/core/client/api_client.dart';
import 'package:imdumb/core/services/remote_config_service.dart';

abstract class BaseRemoteDataSource {
  final ApiClient _apiClient;

  const BaseRemoteDataSource(this._apiClient);

  @protected
  ApiClient get apiClient => _apiClient;

  @protected
  String get tmdbApiKey => RemoteConfigService.instance.theMovieDbApiKey;
}
