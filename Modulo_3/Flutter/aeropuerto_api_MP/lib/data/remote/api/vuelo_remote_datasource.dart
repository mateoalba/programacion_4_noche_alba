import 'package:dio/dio.dart';
import '../../../core/error/api_exception.dart';
import '../../../domain/model/vuelo.dart';
import 'dio_client.dart';

class VueloRemoteDatasource {
  final DioClient _client;

  VueloRemoteDatasource(this._client);

  Future<List<Vuelo>> obtenerVuelos({
    String? busqueda,
    String? estado,
    String? aerolinea,
    bool? internacional,
    int pagina = 1,
    int limite = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': pagina,
        'page_size': limite,
      };
      if (busqueda != null && busqueda.isNotEmpty) {
        queryParams['search'] = busqueda;
      }
      if (estado != null && estado.isNotEmpty) {
        queryParams['estado'] = estado;
      }
      if (aerolinea != null && aerolinea.isNotEmpty) {
        queryParams['aerolinea'] = aerolinea;
      }
      if (internacional != null) {
        queryParams['internacional'] = internacional;
      }

      final response = await _client.get('/vuelos/', queryParameters: queryParams);
      final data = response.data;

      List<dynamic> vuelosList;
      if (data is Map<String, dynamic> && data.containsKey('results')) {
        vuelosList = data['results'] as List<dynamic>;
      } else if (data is List) {
        vuelosList = data;
      } else {
        vuelosList = [];
      }

      return vuelosList
          .map((v) => Vuelo.fromJson(v as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<List<Vuelo>> obtenerVuelosPorRuta({
    required String origen,
    required String destino,
  }) async {
    try {
      final response = await _client.get(
        '/vuelos/por-ruta/',
        queryParameters: {'origen': origen, 'destino': destino},
      );
      final data = response.data;

      List<dynamic> vuelosList;
      if (data is Map<String, dynamic> && data.containsKey('results')) {
        vuelosList = data['results'] as List<dynamic>;
      } else if (data is List) {
        vuelosList = data;
      } else {
        vuelosList = [];
      }

      return vuelosList
          .map((v) => Vuelo.fromJson(v as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Vuelo> obtenerVueloPorId(String id) async {
    try {
      final response = await _client.get('/vuelos/$id/');
      return Vuelo.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Vuelo> crearVuelo(Vuelo vuelo) async {
    try {
      final response = await _client.post(
        '/vuelos/',
        data: vuelo.toJsonCreate(),
      );
      return Vuelo.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Vuelo> actualizarVuelo(String id, Vuelo vuelo) async {
    try {
      final response = await _client.put(
        '/vuelos/$id/',
        data: vuelo.toJsonCreate(),
      );
      return Vuelo.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> eliminarVuelo(String id) async {
    try {
      await _client.delete('/vuelos/$id/');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Vuelo> cambiarEstado(String id, String estado) async {
    try {
      final response = await _client.patch(
        '/vuelos/$id/cambiar-estado/',
        data: {'estado': estado},
      );
      return Vuelo.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
