import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/api/image_upload_service.dart';

sealed class ImageUploadState { const ImageUploadState(); }
class ImageUploadIdle    extends ImageUploadState { const ImageUploadIdle(); }
class ImageUploadLoading extends ImageUploadState { const ImageUploadLoading(); }
class ImageUploadSuccess extends ImageUploadState {
  final String imageUrl;
  const ImageUploadSuccess(this.imageUrl);
}
class ImageUploadError extends ImageUploadState {
  final String message;
  const ImageUploadError(this.message);
}

class ImageUploadNotifier extends StateNotifier<ImageUploadState> {
  final ImageUploadService _service;

  ImageUploadNotifier(this._service) : super(const ImageUploadIdle());

  Future<void> upload(String endpoint, String filePath) async {
    state = const ImageUploadLoading();
    try {
      final url = await _service.uploadImage(
        endpoint: endpoint,
        filePath: filePath,
      );
      state = ImageUploadSuccess(url);
    } catch (e) {
      state = ImageUploadError(e.toString().replaceAll('Exception: ', ''));
    }
  }

  void reset() => state = const ImageUploadIdle();
}

final imageUploadProvider = StateNotifierProvider<ImageUploadNotifier, ImageUploadState>((ref) {
  return ImageUploadNotifier(ref.watch(imageUploadServiceProvider));
});
