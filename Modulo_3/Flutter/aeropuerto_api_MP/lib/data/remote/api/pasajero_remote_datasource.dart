import 'package:dio/dio.dart';
import '../../../core/error/api_exception.dart';
import '../../../domain/model/pasajero.dart';
import 'dio_client.dart';

class PasajeroRemoteDatasource {
  final DioClient _client;

  PasajeroRemoteDatasource(this._client);

  Future<List<Pasajero>> obtenerPasajeros({
    String? busqueda,
    String? vueloCodigo,
    String? estadoEmbarque,
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
      if (vueloCodigo != null && vueloCodigo.isNotEmpty) {
        queryParams['vuelo_codigo'] = vueloCodigo;
      }
      if (estadoEmbarque != null && estadoEmbarque.isNotEmpty) {
        queryParams['estado_embarque'] = estadoEmbarque;
      }

      final response =
          await _client.get('/pasajeros/', queryParameters: queryParams);
      final data = response.data;

      List<dynamic> pasajerosList;
      if (data is Map<String, dynamic> && data.containsKey('results')) {
        pasajerosList = data['results'] as List<dynamic>;
      } else if (data is List) {
        pasajerosList = data;
      } else {
        pasajerosList = [];
      }

      return pasajerosList
          .map((p) => Pasajero.fromJson(p as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Pasajero> obtenerPasajeroPorId(String id) async {
    try {
      final response = await _client.get('/pasajeros/$id/');
      return Pasajero.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Pasajero> crearPasajero(Pasajero pasajero) async {
    try {
      final response = await _client.post(
        '/pasajeros/',
        data: pasajero.toJsonCreate(),
      );
      return Pasajero.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Pasajero> actualizarPasajero(String id, Pasajero pasajero) async {
    try {
      final response = await _client.put(
        '/pasajeros/$id/',
        data: pasajero.toJsonCreate(),
      );
      return Pasajero.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> eliminarPasajero(String id) async {
    try {
      await _client.delete('/pasajeros/$id/');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Pasajero> actualizarEstadoEmbarque(String id, String estado) async {
    try {
      final response = await _client.patch(
        '/pasajeros/$id/embarque/',
        data: {'estado_embarque': estado},
      );
      return Pasajero.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<List<Pasajero>> obtenerPasajerosPorVuelo(
      String codigoVuelo) async {
    try {
      final response =
          await _client.get('/pasajeros/vuelo/$codigoVuelo/');
      final data = response.data;

      List<dynamic> pasajerosList;
      if (data is Map<String, dynamic> && data.containsKey('results')) {
        pasajerosList = data['results'] as List<dynamic>;
      } else if (data is List) {
        pasajerosList = data;
      } else {
        pasajerosList = [];
      }

      return pasajerosList
          .map((p) => Pasajero.fromJson(p as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<Map<String, dynamic>> obtenerEstadisticasEmbarque() async {
    try {
      final response = await _client.get('/pasajeros/stats/embarque/');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
