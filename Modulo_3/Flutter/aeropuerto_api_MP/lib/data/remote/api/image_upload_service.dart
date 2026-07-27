import 'dart:io';
import 'package:dio/dio.dart';
import '../../../core/error/api_exception.dart';
import 'dio_client.dart';

class ImageUploadService {
  final DioClient _client;

  ImageUploadService(this._client);

  Future<String> subirImagen(File imagen) async {
    try {
      final fileName = imagen.path.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imagen.path,
          filename: fileName,
        ),
      });

      final response = await _client.post(
        '/upload/image',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        if (data.containsKey('url')) return data['url'] as String;
        if (data.containsKey('data')) {
          final inner = data['data'];
          if (inner is Map<String, dynamic> && inner.containsKey('url')) {
            return inner['url'] as String;
          }
        }
        if (data.containsKey('path')) return data['path'] as String;
      }
      return '';
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  Future<String> subirAvatar(File imagen) async {
    try {
      final fileName = imagen.path.split('/').last;
      final formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(
          imagen.path,
          filename: fileName,
        ),
      });

      final response = await _client.post(
        '/upload/avatar',
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        if (data.containsKey('url')) return data['url'] as String;
        if (data.containsKey('data')) {
          final inner = data['data'];
          if (inner is Map<String, dynamic> && inner.containsKey('url')) {
            return inner['url'] as String;
          }
        }
      }
      return '';
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
