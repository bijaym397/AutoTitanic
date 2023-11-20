// coverage:ignore-file
/// An asset constant class which will hold all the
/// assets path which are used in the application.
///
/// Will be ignored for test since all are static values and would not change.
class AssetConstants {
  const AssetConstants._();

  static const String _logoPath = 'assets/logo';
  static const String _svgPath = 'assets/svg';

  static const String logo = '$_logoPath/logo.png';

  static const String instagram = '$_svgPath/instagram.svg';
  static const String facebook = '$_svgPath/facebook.svg';
  static const String twitter = '$_svgPath/twitter.svg';
  static const String youtube = '$_svgPath/youtube.svg';
}
