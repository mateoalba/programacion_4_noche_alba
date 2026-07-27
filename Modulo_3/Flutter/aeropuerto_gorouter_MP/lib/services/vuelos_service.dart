import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/vuelo.dart';
import 'auth_service.dart';

class VuelosService {
  static const String _baseUrl = 'https://alba-vuelos.uaeftt-ute.site/api';
  static final VuelosService _instance = VuelosService._();
  factory VuelosService() => _instance;
  VuelosService._();

  final AuthService _auth = AuthService();

  Future<http.Response> _authorizedRequest(
    Future<http.Response> Function() request,
  ) async {
    var res = await request();
    if (res.statusCode == 401) {
      final refreshed = await _auth.refresh();
      if (refreshed) {
        res = await request();
      }
    }
    return res;
  }

  Future<Map<String, dynamic>> getVuelos({
    String? search,
    String? estado,
  }) async {
    final params = <String, String>{};
    if (search != null && search.isNotEmpty) params['search'] = search;
    if (estado != null && estado.isNotEmpty) params['estado'] = estado;
    final uri = Uri.parse('$_baseUrl/vuelos/')
        .replace(queryParameters: params.isNotEmpty ? params : null);
    final res = await _authorizedRequest(
      () async => http.get(uri, headers: _auth.authHeaders),
    );
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return {
        'count': data['count'] as int? ?? 0,
        'results': (data['results'] as List<dynamic>?)
                ?.map((e) => Vuelo.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      };
    }
    throw Exception('Error al obtener vuelos: ${res.statusCode}');
  }

  Future<Vuelo> getVuelo(String id) async {
    final res = await _authorizedRequest(
      () async => http.get(
        Uri.parse('$_baseUrl/vuelos/$id/'),
        headers: _auth.authHeaders,
      ),
    );
    if (res.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(res.body));
    }
    throw Exception('Error al obtener vuelo: ${res.statusCode}');
  }

  Future<Vuelo> crearVuelo(Map<String, dynamic> data) async {
    final res = await _authorizedRequest(
      () async => http.post(
        Uri.parse('$_baseUrl/vuelos/'),
        headers: _auth.authHeaders,
        body: jsonEncode(data),
      ),
    );
    if (res.statusCode == 201) {
      return Vuelo.fromJson(jsonDecode(res.body));
    }
    throw Exception('Error al crear vuelo: ${res.statusCode}');
  }

  Future<Vuelo> actualizarVuelo(String id, Map<String, dynamic> data) async {
    final res = await _authorizedRequest(
      () async => http.put(
        Uri.parse('$_baseUrl/vuelos/$id/'),
        headers: _auth.authHeaders,
        body: jsonEncode(data),
      ),
    );
    if (res.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(res.body));
    }
    throw Exception('Error al actualizar vuelo: ${res.statusCode}');
  }

  Future<void> eliminarVuelo(String id) async {
    final res = await _authorizedRequest(
      () async => http.delete(
        Uri.parse('$_baseUrl/vuelos/$id/'),
        headers: _auth.authHeaders,
      ),
    );
    if (res.statusCode != 204 && res.statusCode != 200) {
      throw Exception('Error al eliminar vuelo: ${res.statusCode}');
    }
  }

  Future<Vuelo> cambiarEstado(String id, String estado) async {
    final res = await _authorizedRequest(
      () async => http.patch(
        Uri.parse('$_baseUrl/vuelos/$id/cambiar-estado/'),
        headers: _auth.authHeaders,
        body: jsonEncode({'estado': estado}),
      ),
    );
    if (res.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(res.body));
    }
    throw Exception('Error al cambiar estado: ${res.statusCode}');
  }
}
