import 'package:url_launcher/url_launcher.dart';

class Validators {
  const Validators._();

  static Future<bool> isValidUrl(String url) => canLaunchUrl(Uri.parse(url));
}
