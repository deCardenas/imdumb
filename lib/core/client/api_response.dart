final class ApiResponse {
  final int statusCode;
  final String statusMessage;
  final dynamic data;
  final Map<String, dynamic> headers;

  const ApiResponse({
    required this.statusCode,
    required this.statusMessage,
    required this.data,
    required this.headers,
  });
}
