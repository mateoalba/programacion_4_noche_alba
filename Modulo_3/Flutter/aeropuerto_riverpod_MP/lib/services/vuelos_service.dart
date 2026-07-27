import 'dart:convert';
import '../models/vuelo.dart';
import 'auth_service.dart';

class VuelosService {
  static const String _baseUrl = 'https://alba-vuelos.uaeftt-ute.site/api';
  final AuthService _authService;

  VuelosService(this._authService);

  Future<List<Vuelo>> getVuelos({String? search, String? estado}) async {
    String url = '$_baseUrl/vuelos/';
    final params = <String, String>{};
    if (search != null && search.isNotEmpty) params['search'] = search;
    if (estado != null && estado.isNotEmpty) params['estado'] = estado;
    if (params.isNotEmpty) {
      url += '?${params.entries.map((e) => '${e.key}=${Uri.encodeComponent(e.value)}').join('&')}';
    }

    final response = await _authService.authenticatedGet(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      return results.map((json) => Vuelo.fromJson(json)).toList();
    }
    throw Exception('Error al cargar vuelos: ${response.statusCode}');
  }

  Future<Vuelo> getVuelo(String id) async {
    final response = await _authService.authenticatedGet('$_baseUrl/vuelos/$id/');
    if (response.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(response.body));
    }
    throw Exception('Error al cargar vuelo: ${response.statusCode}');
  }

  Future<Vuelo> crearVuelo(Map<String, dynamic> data) async {
    final response = await _authService.authenticatedPost(
      '$_baseUrl/vuelos/',
      body: data,
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(response.body));
    }
    throw Exception('Error al crear vuelo: ${response.body}');
  }

  Future<Vuelo> actualizarVuelo(String id, Map<String, dynamic> data) async {
    final response = await _authService.authenticatedPut(
      '$_baseUrl/vuelos/$id/',
      body: data,
    );
    if (response.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(response.body));
    }
    throw Exception('Error al actualizar vuelo: ${response.body}');
  }

  Future<void> eliminarVuelo(String id) async {
    final response = await _authService.authenticatedDelete('$_baseUrl/vuelos/$id/');
    if (response.statusCode != 204 && response.statusCode != 200) {
      throw Exception('Error al eliminar vuelo: ${response.statusCode}');
    }
  }

  Future<Vuelo> cambiarEstado(String id, String estado) async {
    final response = await _authService.authenticatedPatch(
      '$_baseUrl/vuelos/$id/cambiar-estado/',
      body: {'estado': estado},
    );
    if (response.statusCode == 200) {
      return Vuelo.fromJson(jsonDecode(response.body));
    }
    throw Exception('Error al cambiar estado: ${response.body}');
  }
}
