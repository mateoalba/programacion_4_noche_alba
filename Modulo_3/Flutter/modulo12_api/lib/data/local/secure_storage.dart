import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorage() : _storage = const FlutterSecureStorage();

  // ── Tokens ──────────────────────────────────────────────
  Future<void> saveTokens(String access, String refresh) async {
    await _storage.write(key: 'access_token', value: access);
    await _storage.write(key: 'refresh_token', value: refresh);
  }

  Future<String?> getAccess() async => _storage.read(key: 'access_token');
  Future<String?> getRefresh() async => _storage.read(key: 'refresh_token');

  // ── Usuario ─────────────────────────────────────────────
  Future<void> saveUser({
    required int id,
    required String username,
    required String email,
    required bool isStaff,
  }) async {
    await _storage.write(key: 'user_id', value: id.toString());
    await _storage.write(key: 'username', value: username);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'is_staff', value: isStaff.toString());
  }

  Future<Map<String, String>?> getUser() async {
    final id = await _storage.read(key: 'user_id');
    if (id == null) return null;
    return {
      'id':       id,
      'username': await _storage.read(key: 'username') ?? '',
      'email':    await _storage.read(key: 'email') ?? '',
      'is_staff': await _storage.read(key: 'is_staff') ?? 'false',
    };
  }

  Future<bool> isLoggedIn() async {
    final access = await _storage.read(key: 'access_token');
    return access != null && access.isNotEmpty;
  }

  Future<void> clearSession() async {
    await _storage.deleteAll();
  }
}

final secureStorageProvider = Provider<SecureStorage>((_) => SecureStorage());
