import 'package:dio/dio.dart';
import '../../../core/error/api_exception.dart';
import '../../../domain/model/user.dart';
import 'dio_client.dart';

class UserRemoteDatasource {
  final DioClient _client;

  UserRemoteDatasource(this._client);

  Future<List<LoggedUser>> obtenerUsuarios({
    String? busqueda,
    int pagina = 1,
    int limite = 20,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': pagina,
        'limit': limite,
      };
      if (busqueda != null && busqueda.isNotEmpty) {
        queryParams['search'] = busqueda;
      }

      final response =
          await _client.get('/users', queryParameters: queryParams);
      final data = response.data;

      List<dynamic> usersList;
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        usersList = data['data'] as List<dynamic>;
      } else if (data is List) {
        usersList = data;
      } else {
        usersList = [];
      }

      return usersList
          .map((u) => LoggedUser.fromJson(u as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<LoggedUser> obtenerUsuarioPorId(int id) async {
    try {
      final response = await _client.get('/users/$id');
      final data = response.data;
      Map<String, dynamic> userData;
      if (data is Map<String, dynamic> && data.containsKey('data')) {
        userData = data['data'] as Map<String, dynamic>;
      } else {
        userData = data as Map<String, dynamic>;
      }
      return LoggedUser.fromJson(userData);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<void> eliminarUsuario(int id) async {
    try {
      await _client.delete('/users/$id');
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
