sealed class AppException implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => 'AppException: $message';
}

final class NotAuthorizedException extends AppException {
  const NotAuthorizedException()
    : super('Not authorized to perform this action.');
}

final class ConnectionServerException extends AppException {
  const ConnectionServerException()
    : super('Failed to connect to the server. Please try again later.');
}
