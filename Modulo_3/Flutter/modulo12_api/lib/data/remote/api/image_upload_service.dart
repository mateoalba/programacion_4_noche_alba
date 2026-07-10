import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dio_client.dart';

class ImageUploadService {
  final Dio _dio;

  ImageUploadService(this._dio);

  Future<String> uploadImage({
    required String endpoint,
    required String filePath,
  }) async {
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        filePath,
        filename: filePath.split('/').last,
      ),
    });

    final response = await _dio.patch(
      endpoint,
      data: formData,
      options: Options(
        headers: {'Content-Type': 'multipart/form-data'},
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    final data = response.data as Map<String, dynamic>;
    return data['image_url'] as String? ??
           data['avatar_url'] as String? ??
           '';
  }
}

final imageUploadServiceProvider = Provider<ImageUploadService>((ref) {
  return ImageUploadService(ref.watch(dioProvider));
});
