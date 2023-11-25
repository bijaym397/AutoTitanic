// coverage:ignore-file
/// An asset constant class which will hold all the
/// assets path which are used in the application.
///
/// Will be ignored for test since all are static values and would not change.
class AssetConstants {
  const AssetConstants._();

  static const String _logoPath = 'assets/logo';
  static const String _svgPath = 'assets/svg';
  static const String _imagePath = 'assets/images';

  static const String logo = '$_logoPath/logo.png';

  static const String instagram = '$_svgPath/instagram.svg';
  static const String facebook = '$_svgPath/facebook.svg';
  static const String twitter = '$_svgPath/twitter.svg';
  static const String youtube = '$_svgPath/youtube.svg';

  static const String getOnPlaystore = '$_imagePath/get_on_playstore.png';
  static const String getOnAppstore = '$_imagePath/get_on_appstore.png';
  static const String pageHeaderBg = '$_imagePath/page_header_bg.webp';
}
