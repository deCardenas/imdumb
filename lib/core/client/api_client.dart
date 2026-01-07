import 'package:imdumb/core/client/api_response.dart' show ApiResponse;

/// ApiClient define el contrato para cualquier cliente HTTP.
///
///   SOLID:
/// - SRP (Single Responsibility):
///   Esta interface solo define operaciones HTTP, no implementa lógica.
///
/// - DIP (Dependency Inversion):
///   Las capas superiores dependen de esta abstracción y no de Dio directamente.
abstract interface class ApiClient {
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<ApiResponse> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<ApiResponse> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<ApiResponse> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
