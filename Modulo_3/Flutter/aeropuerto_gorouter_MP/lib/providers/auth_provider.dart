import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

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
  final String usuario;
  const Autenticado(this.usuario);
}

class ErrorAuth extends AuthState {
  final String mensaje;
  const ErrorAuth(this.mensaje);
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

class AuthNotifier extends Notifier<AuthState> {
  final AuthService _authService = AuthService();

  @override
  AuthState build() {
    if (_authService.isLoggedIn) {
      return Autenticado(_authService.username ?? '');
    }
    return const SinSesion();
  }

  Future<void> login(String usuario, String contrasena) async {
    state = const Cargando();
    final success = await _authService.login(usuario, contrasena);
    if (success) {
      state = Autenticado(_authService.username ?? usuario);
    } else {
      state = const ErrorAuth('Credenciales incorrectas');
    }
  }

  void logout() {
    _authService.logout();
    state = const SinSesion();
  }
}
