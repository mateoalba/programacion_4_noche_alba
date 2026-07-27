import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/model/auth_models.dart';
import '../../domain/model/auth_state.dart';
import '../../domain/model/user.dart';
import '../../data/local/secure_storage.dart';
import '../../data/remote/api/auth_remote_datasource.dart';
import '../../data/remote/api/dio_client.dart';

final authDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  final client = ref.watch(dioClientProvider);
  final storage = ref.watch(secureStorageProvider);
  return AuthRemoteDatasource(client, storage);
});

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final datasource = ref.watch(authDatasourceProvider);
  final storage = ref.watch(secureStorageProvider);
  return AuthNotifier(datasource, storage)..restaurarSesion();
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRemoteDatasource _datasource;
  final SecureStorage _storage;

  AuthNotifier(this._datasource, this._storage) : super(const SinSesion());

  Future<void> restaurarSesion() async {
    state = const Cargando();
    try {
      final user = await _datasource.restaurarSesion();
      if (user != null) {
        state = Autenticado(user);
      } else {
        state = const SinSesion();
      }
    } catch (e) {
      state = const SinSesion();
    }
  }

  Future<bool> login(String username, String password) async {
    state = const Cargando();
    try {
      final response = await _datasource.login(
        LoginRequest(username: username, password: password),
      );
      state = Autenticado(response.usuario);
      return true;
    } catch (e) {
      state = ErrorAuth(e.toString().replaceFirst('Exception: ', ''));
      return false;
    }
  }

  Future<bool> register(
      String username, String email, String password) async {
    state = const Cargando();
    try {
      final response = await _datasource.register(
        RegisterRequest(
          username: username,
          email: email,
          password: password,
          passwordConfirm: password,
        ),
      );
      state = Autenticado(response.usuario);
      return true;
    } catch (e) {
      state = ErrorAuth(e.toString().replaceFirst('Exception: ', ''));
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _datasource.logout();
    } catch (e) {
      // Continue with local logout
    }
    await _storage.limpiarTodo();
    state = const SinSesion();
  }

  Future<void> actualizarPerfil(Map<String, dynamic> campos) async {
    try {
      final user = await _datasource.actualizarPerfil(campos);
      state = Autenticado(user);
    } catch (e) {
      rethrow;
    }
  }

  LoggedUser? get usuarioActual {
    if (state is Autenticado) {
      return (state as Autenticado).usuario as LoggedUser;
    }
    return null;
  }
}
