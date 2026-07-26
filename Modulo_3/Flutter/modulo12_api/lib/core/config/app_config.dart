import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get baseUrl =>
      dotenv.env['API_BASE_URL'] ?? 'http://10.0.2.2:8000/api';

  static const String appName = 'Flutter Shop App';
  static const double taxRate = 0.15;

  /// If [url] is already absolute (starts with http:// or https://) return it
  /// as-is; otherwise prepend [baseUrl].
  static String? resolveImageUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.startsWith('http://') || url.startsWith('https://')) return url;
    return '$baseUrl$url';
  }

  AppConfig._();
}
