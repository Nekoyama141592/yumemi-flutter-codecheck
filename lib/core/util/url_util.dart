import 'package:url_launcher/url_launcher.dart';

class UrlUtil {
  const UrlUtil._();
  static Future<void> openExternal(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      throw ArgumentError('Invalid URL: $url');
    }

    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok) {
      throw Exception('Could not launch: $url');
    }
  }
}
