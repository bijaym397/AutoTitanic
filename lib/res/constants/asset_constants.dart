import 'package:auto_titanic/utils/utils.dart';

/// An asset constant class which will hold all the
/// assets path which are used in the application.
///
/// Will be ignored for test since all are static values and would not change.
class AssetConstants {
  const AssetConstants._();

  static const String _logoPath = 'assets/logo';
  static const String _svgPath = 'assets/svg';
  static const String _imagePath = 'assets/images';
  static const String _brandPath = '$_imagePath/brands';

  static const String logo = '$_logoPath/logo.png';

  static const String instagram = '$_svgPath/instagram.svg';
  static const String facebook = '$_svgPath/facebook.svg';
  static const String twitter = '$_svgPath/twitter.svg';
  static const String youtube = '$_svgPath/youtube.svg';

  static const String getOnPlaystore = '$_imagePath/get_on_playstore.png';
  static const String getOnAppstore = '$_imagePath/get_on_appstore.png';
  static const String pageHeaderBg = '$_imagePath/page_header_bg.webp';
  static const String homeTopBg = '$_imagePath/home_top_bg.webp';

  static const String car1 = '$_imagePath/car1.jpeg';
  static const String car2 = '$_imagePath/car2.jpg';
  static const String car3 = '$_imagePath/car3.jpg';
  static const String car4 = '$_imagePath/car4.jpg';

  static const List<String> _cars = [car1, car2, car3, car4];
  static String get car => _cars.random;

  static const String bmw = '$_brandPath/bmw.png';
  static const String honda = '$_brandPath/honda.png';
  static const String hyundai = '$_brandPath/hyundai.png';
  static const String lexus = '$_brandPath/lexus.png';
  static const String mercedes = '$_brandPath/mercedes.png';
  static const String mitsubishi = '$_brandPath/mitsubishi.png';
  static const String porsche = '$_brandPath/porsche.png';
  static const String toyota = '$_brandPath/toyota.jpg';
}
