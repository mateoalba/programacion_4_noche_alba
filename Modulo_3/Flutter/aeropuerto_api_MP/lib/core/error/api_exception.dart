import 'package:dio/dio.dart';

class ApiException implements Exception {
  final int? statusCode;
  final String message;
  final dynamic data;

  ApiException({
    this.statusCode,
    required this.message,
    this.data,
  });

  factory ApiException.fromDioException(DioException e) {
    String message;
    int? statusCode = e.response?.statusCode;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Tiempo de conexión agotado. Verifique su red.';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Tiempo de envío agotado.';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Tiempo de recepción agotado.';
        break;
      case DioExceptionType.badResponse:
        message = _parsearRespuestaError(e.response?.data);
        break;
      case DioExceptionType.cancel:
        message = 'Solicitud cancelada.';
        break;
      case DioExceptionType.connectionError:
        message = 'Error de conexión. Verifique su red.';
        break;
      default:
        message = 'Error inesperado: ${e.message}';
    }

    return ApiException(
      statusCode: statusCode,
      message: message,
      data: e.response?.data,
    );
  }

  static String _parsearRespuestaError(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data.containsKey('message')) return data['message'].toString();
      if (data.containsKey('error')) return data['error'].toString();
      if (data.containsKey('detail')) return data['detail'].toString();
    }
    if (data is String) return data;
    return 'Error del servidor';
  }

  @override
  String toString() => 'ApiException($statusCode): $message';

  bool get esNoAutorizado => statusCode == 401;
  bool get esNoEncontrado => statusCode == 404;
  bool get esValidacion => statusCode == 422;
  bool get esServidor => statusCode != null && statusCode! >= 500;
}
