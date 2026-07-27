import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/vuelo.dart';

class ApiService {
  static const String baseUrl = 'https://alba-vuelos.uaeftt-ute.site/api';

  String? _accessToken;
  String? _refreshToken;
  Map<String, dynamic>? _usuario;

  bool get autenticado => _accessToken != null;
  Map<String, dynamic>? get usuario => _usuario;

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        if (_accessToken != null) 'Authorization': 'Bearer $_accessToken',
      };

  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login/'),
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

  Future<bool> _refrescarToken() async {
    if (_refreshToken == null) return false;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/token/refresh/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refresh': _refreshToken}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _accessToken = data['access'];
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<http.Response> _requestWithRetry(
      Future<http.Response> Function() request) async {
    var response = await request();

    if (response.statusCode == 401) {
      final refreshed = await _refrescarToken();
      if (refreshed) {
        response = await request();
      }
    }

    return response;
  }

  Future<List<Vuelo>> getVuelos() async {
    final response = await _requestWithRetry(
      () => http.get(Uri.parse('$baseUrl/vuelos/'), headers: _headers),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((j) => Vuelo.fromJson(j)).toList();
    }
    throw Exception('Error al cargar vuelos: ${response.statusCode}');
  }

  Future<Vuelo> getVuelo(String id) async {
    final response = await _requestWithRetry(
      () => http.get(Uri.parse('$baseUrl/vuelos/$id/'), headers: _headers),
    );

    if (response.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(response.body));
    }
    throw Exception('Error al cargar vuelo: ${response.statusCode}');
  }

  Future<Vuelo> crearVuelo(Vuelo vuelo) async {
    final response = await _requestWithRetry(
      () => http.post(
        Uri.parse('$baseUrl/vuelos/'),
        headers: _headers,
        body: jsonEncode(vuelo.toJson()),
      ),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(response.body));
    }
    String msg = 'Error al crear vuelo: ${response.statusCode}';
    try {
      final body = jsonDecode(response.body);
      if (body is Map) {
        msg += ' - ${body.values.join(', ')}';
      }
    } catch (_) {}
    throw Exception(msg);
  }

  Future<Vuelo> actualizarVuelo(String id, Vuelo vuelo) async {
    final response = await _requestWithRetry(
      () => http.put(
        Uri.parse('$baseUrl/vuelos/$id/'),
        headers: _headers,
        body: jsonEncode(vuelo.toJson()),
      ),
    );

    if (response.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(response.body));
    }
    String msg = 'Error al actualizar vuelo: ${response.statusCode}';
    try {
      final body = jsonDecode(response.body);
      if (body is Map) {
        msg += ' - ${body.values.join(', ')}';
      }
    } catch (_) {}
    throw Exception(msg);
  }

  Future<void> eliminarVuelo(String id) async {
    final response = await _requestWithRetry(
      () => http.delete(Uri.parse('$baseUrl/vuelos/$id/'), headers: _headers),
    );

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception('Error al eliminar vuelo: ${response.statusCode}');
    }
  }

  Future<Vuelo> cambiarEstado(String id, String nuevoEstado) async {
    final response = await _requestWithRetry(
      () => http.patch(
        Uri.parse('$baseUrl/vuelos/$id/cambiar-estado/'),
        headers: _headers,
        body: jsonEncode({'estado': nuevoEstado}),
      ),
    );

    if (response.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(response.body));
    }
    throw Exception('Error al cambiar estado: ${response.statusCode}');
  }
}
