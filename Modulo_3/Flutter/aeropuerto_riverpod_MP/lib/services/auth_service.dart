import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _baseUrl = 'https://alba-vuelos.uaeftt-ute.site/api';

  String? _accessToken;
  String? _refreshToken;
  Map<String, dynamic>? _usuario;

  String? get accessToken => _accessToken;
  String? get refreshJwt => _refreshToken;
  Map<String, dynamic>? get usuario => _usuario;
  bool get isLoggedIn => _accessToken != null;

  Map<String, String> get _authHeaders => {
    'Content-Type': 'application/json',
    if (_accessToken != null) 'Authorization': 'Bearer $_accessToken',
  };

  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/login/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _accessToken = data['access'];
        _refreshToken = data['refresh'];
        _usuario = data['usuario'];
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  void logout() {
    _accessToken = null;
    _refreshToken = null;
    _usuario = null;
  }

  Future<bool> refreshToken() async {
    if (_refreshToken == null) return false;

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/refresh/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refresh': _refreshToken}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _accessToken = data['access'];
        return true;
      }
      _refreshToken = null;
      _accessToken = null;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<http.Response> authenticatedGet(String url) async {
    var response = await http.get(Uri.parse(url), headers: _authHeaders);
    if (response.statusCode == 401 && _refreshToken != null) {
      final refreshed = await refreshToken();
      if (refreshed) {
        response = await http.get(Uri.parse(url), headers: _authHeaders);
      }
    }
    return response;
  }

  Future<http.Response> authenticatedPost(String url, {Map<String, dynamic>? body}) async {
    var response = await http.post(
      Uri.parse(url),
      headers: _authHeaders,
      body: body != null ? jsonEncode(body) : null,
    );
    if (response.statusCode == 401 && _refreshToken != null) {
      final refreshed = await refreshToken();
      if (refreshed) {
        response = await http.post(
          Uri.parse(url),
          headers: _authHeaders,
          body: body != null ? jsonEncode(body) : null,
        );
      }
    }
    return response;
  }

  Future<http.Response> authenticatedPut(String url, {Map<String, dynamic>? body}) async {
    var response = await http.put(
      Uri.parse(url),
      headers: _authHeaders,
      body: body != null ? jsonEncode(body) : null,
    );
    if (response.statusCode == 401 && _refreshToken != null) {
      final refreshed = await refreshToken();
      if (refreshed) {
        response = await http.put(
          Uri.parse(url),
          headers: _authHeaders,
          body: body != null ? jsonEncode(body) : null,
        );
      }
    }
    return response;
  }

  Future<http.Response> authenticatedPatch(String url, {Map<String, dynamic>? body}) async {
    var response = await http.patch(
      Uri.parse(url),
      headers: _authHeaders,
      body: body != null ? jsonEncode(body) : null,
    );
    if (response.statusCode == 401 && _refreshToken != null) {
      final refreshed = await refreshToken();
      if (refreshed) {
        response = await http.patch(
          Uri.parse(url),
          headers: _authHeaders,
          body: body != null ? jsonEncode(body) : null,
        );
      }
    }
    return response;
  }

  Future<http.Response> authenticatedDelete(String url) async {
    var response = await http.delete(Uri.parse(url), headers: _authHeaders);
    if (response.statusCode == 401 && _refreshToken != null) {
      final refreshed = await refreshToken();
      if (refreshed) {
        response = await http.delete(Uri.parse(url), headers: _authHeaders);
      }
    }
    return response;
  }
}
