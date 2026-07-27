import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _baseUrl = 'https://alba-vuelos.uaeftt-ute.site/api';
  static final AuthService _instance = AuthService._();
  factory AuthService() => _instance;
  AuthService._();

  String? _accessToken;
  String? _refreshToken;
  String? _username;

  String? get accessToken => _accessToken;
  bool get isLoggedIn => _accessToken != null;
  String? get username => _username;

  Future<bool> login(String user, String pass) async {
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/login/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': user, 'password': pass}),
    );
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      _accessToken = data['access'];
      _refreshToken = data['refresh'];
      _username = (data['usuario'] as Map<String, dynamic>?)?['username'] as String?;
      return true;
    }
    return false;
  }

  void logout() {
    _accessToken = null;
    _refreshToken = null;
    _username = null;
  }

  Future<bool> refresh() async {
    if (_refreshToken == null) return false;
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/refresh/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refresh': _refreshToken}),
    );
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      _accessToken = data['access'];
      return true;
    }
    logout();
    return false;
  }

  Map<String, String> get authHeaders => {
        if (_accessToken != null) 'Authorization': 'Bearer $_accessToken',
        'Content-Type': 'application/json',
      };
}
