import 'package:flutter/foundation.dart';
import 'package:imdumb/core/client/api_client.dart';
import 'package:imdumb/core/services/remote_config_service.dart';

/// BaseRemoteDataSource define un data source básico
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Centraliza responsabilidades comunes de los data sources remotos
///   (acceso al ApiClient y API Key).
///
/// - Open / Closed Principle (OCP):
///   Permite extender data sources específicos sin modificar esta clase base.
///
/// - DIP (Dependency Inversion):
///   Depende de la abstracción ApiClient, no de una implementación concreta.
abstract class BaseRemoteDataSource {
  final ApiClient _apiClient;

  const BaseRemoteDataSource(this._apiClient);

  @protected
  ApiClient get apiClient => _apiClient;

  @protected
  String get tmdbApiKey => RemoteConfigService.instance.theMovieDbApiKey;
}
