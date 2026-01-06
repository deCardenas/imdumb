sealed class AppFailure {
  final String message;
  const AppFailure(this.message);
}

// General failures
class InternalServerFailure extends AppFailure {
  const InternalServerFailure(super.message);
}

class NonConnectionFailure extends AppFailure {
  const NonConnectionFailure() : super('Error de conexion');
}

class NotAuthorizedFailure extends AppFailure {
  const NotAuthorizedFailure()
    : super('Usted no está autorizado para realizar esta acción');
}

//////
class UnexpectedServerFailure extends AppFailure {
  const UnexpectedServerFailure(super.message);
}

class ConnectionServerFailure extends AppFailure {
  const ConnectionServerFailure(super.message);
}

class UnavailableServiceFailure extends AppFailure {
  const UnavailableServiceFailure(super.message);
}

class InputServerFailure extends AppFailure {
  const InputServerFailure(super.message);
}

class LocalFailure extends AppFailure {
  const LocalFailure(super.message);
}
