import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});

  factory ApiException.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ApiException('Tiempo de espera agotado');
      case DioExceptionType.badResponse:
        final data = e.response?.data;
        if (data is Map<String, dynamic>) {
          final detail = data['detail'] ?? data['message'] ?? _extractFirstError(data);
          return ApiException(detail.toString(), statusCode: e.response?.statusCode);
        }
        return ApiException('Error del servidor (${e.response?.statusCode})');
      case DioExceptionType.cancel:
        return const ApiException('Solicitud cancelada');
      default:
        return const ApiException('Error de conexión. Verifica tu internet.');
    }
  }

  static String _extractFirstError(Map<String, dynamic> data) {
    for (final entry in data.entries) {
      final value = entry.value;
      if (value is List && value.isNotEmpty) return value.first.toString();
      if (value is String) return value;
    }
    return 'Error desconocido';
  }

  @override
  String toString() => message;
}
