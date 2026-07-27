import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorage(this._storage);

  static const _keyToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';
  static const _keyUser = 'user_data';

  Future<void> guardarToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  Future<String?> obtenerToken() async {
    return await _storage.read(key: _keyToken);
  }

  Future<void> guardarRefreshToken(String token) async {
    await _storage.write(key: _keyRefreshToken, value: token);
  }

  Future<String?> obtenerRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  Future<void> guardarUsuario(String userData) async {
    await _storage.write(key: _keyUser, value: userData);
  }

  Future<String?> obtenerUsuario() async {
    return await _storage.read(key: _keyUser);
  }

  Future<void> limpiarTodo() async {
    await _storage.deleteAll();
  }

  Future<bool> tieneToken() async {
    final token = await obtenerToken();
    return token != null && token.isNotEmpty;
  }
}

final secureStorageProvider = Provider<SecureStorage>((ref) {
  const storage = FlutterSecureStorage();
  return SecureStorage(storage);
});
