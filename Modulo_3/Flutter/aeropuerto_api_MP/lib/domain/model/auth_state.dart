sealed class AuthState {
  const AuthState();
}

class SinSesion extends AuthState {
  const SinSesion();
}

class Cargando extends AuthState {
  const Cargando();
}

class Autenticado extends AuthState {
  final dynamic usuario;
  const Autenticado(this.usuario);
}

class ErrorAuth extends AuthState {
  final String mensaje;
  const ErrorAuth(this.mensaje);
}
