import 'package:dio/dio.dart';
import '../../../core/error/api_exception.dart';
import '../../../domain/model/auth_models.dart';
import '../../../domain/model/user.dart';
import '../../local/secure_storage.dart';
import 'dio_client.dart';

class AuthRemoteDatasource {
  final DioClient _client;
  final SecureStorage _storage;

  AuthRemoteDatasource(this._client, this._storage);

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await _client.post(
        '/auth/login/',
        data: request.toJson(),
      );
      final data = response.data as Map<String, dynamic>;
      final authResponse = AuthResponse.fromJson(data);
      await _storage.guardarToken(authResponse.tokens.accessToken);
      await _storage.guardarRefreshToken(authResponse.tokens.refreshToken);
      await _storage.guardarUsuario(
        authResponse.usuario.toJson().toString(),
      );
      return authResponse;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _client.post(
        '/auth/registro/',
        data: request.toJson(),
      );
      final data = response.data as Map<String, dynamic>;
      final authResponse = AuthResponse.fromJson(data);
      await _storage.guardarToken(authResponse.tokens.accessToken);
      await _storage.guardarRefreshToken(authResponse.tokens.refreshToken);
      return authResponse;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> logout() async {
    final refreshToken = await _storage.obtenerRefreshToken();
    try {
      await _client.post(
        '/auth/logout/',
        data: {'refresh': refreshToken},
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    } finally {
      await _storage.limpiarTodo();
    }
  }

  Future<void> forgotPassword(ForgotPasswordRequest request) async {
    try {
      await _client.post(
        '/auth/forgot-password/',
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    try {
      await _client.post(
        '/auth/reset-password/',
        data: request.toJson(),
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<LoggedUser> obtenerPerfil() async {
    try {
      final response = await _client.get('/auth/perfil/');
      final data = response.data as Map<String, dynamic>;
      return LoggedUser.fromJson(data);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<LoggedUser> actualizarPerfil(Map<String, dynamic> campos) async {
    try {
      final response = await _client.put('/auth/perfil/', data: campos);
      final data = response.data as Map<String, dynamic>;
      return LoggedUser.fromJson(data);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<LoggedUser?> restaurarSesion() async {
    final token = await _storage.obtenerToken();
    if (token == null || token.isEmpty) return null;

    try {
      final user = await obtenerPerfil();
      return user;
    } catch (e) {
      await _storage.limpiarTodo();
      return null;
    }
  }
}
