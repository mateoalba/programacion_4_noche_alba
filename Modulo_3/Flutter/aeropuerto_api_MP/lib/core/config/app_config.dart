import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get baseUrl =>
      dotenv.env['API_BASE_URL'] ??
      'https://alba-vuelos.uaeftt-ute.site/api';

  static double get tasaImpuesto => 0.0;

  static String resolveImageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    if (path.startsWith('http')) return path;
    return '$baseUrl/$path';
  }
}
