import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../data/local/secure_storage.dart';

class DioClient {
  final SecureStorage _storage;
  late final Dio _dio;
  bool _isRefreshing = false;
  final List<_RetryRequest> _pendingRequests = [];

  DioClient(this._storage) {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    _dio.interceptors.add(_AuthInterceptor(this));
  }

  Dio get dio => _dio;

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.get(path, queryParameters: queryParameters, options: options);
  }

  Future<Response> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.post(path, data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response> put(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.put(path, data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response> patch(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.patch(path, data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response> delete(String path,
      {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.delete(path, data: data, queryParameters: queryParameters, options: options);
  }

  Future<String?> _refreshToken(String refreshToken) async {
    try {
      final response = await Dio().post(
        '${AppConfig.baseUrl}/auth/refresh/',
        data: {'refresh': refreshToken},
      );
      final data = response.data;
      if (data is Map<String, dynamic> && data.containsKey('access')) {
        return data['access'] as String;
      }
      if (data is Map<String, dynamic> && data.containsKey('accessToken')) {
        return data['accessToken'] as String;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> _clearSession() async {
    await _storage.limpiarTodo();
  }
}

class _RetryRequest {
  final RequestOptions options;
  final Completer<Response> completer;
  _RetryRequest(this.options, this.completer);
}

class _AuthInterceptor extends Interceptor {
  final DioClient _client;

  _AuthInterceptor(this._client);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _client._storage.obtenerToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_client._isRefreshing) {
      _client._isRefreshing = true;
      final refreshToken = await _client._storage.obtenerRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        await _client._clearSession();
        _client._isRefreshing = false;
        handler.next(err);
        return;
      }

      try {
        final newToken = await _client._refreshToken(refreshToken);
        if (newToken != null) {
          await _client._storage.guardarToken(newToken);
          err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
          _client._isRefreshing = false;
          final response = await _client._dio.fetch(err.requestOptions);
          handler.resolve(response);
          return;
        }
      } catch (e) {
        // Fall through
      }

      await _client._clearSession();
      _client._isRefreshing = false;
    }

    if (err.response?.statusCode == 401) {
      final completer = Completer<Response>();
      _client._pendingRequests.add(_RetryRequest(err.requestOptions, completer));
      try {
        final response = await completer.future;
        handler.resolve(response);
        return;
      } catch (e) {
        handler.next(err);
        return;
      }
    }

    handler.next(err);
  }
}

final dioClientProvider = Provider<DioClient>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return DioClient(storage);
});
