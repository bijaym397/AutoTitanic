/// `AppConstants` is a singleton class with all static variables.
///
/// It contains all constants that are to be used within the project
///
class AppConstants {
  const AppConstants._();

  static const String appName = 'AutoTitanic';

  static const Duration timeOutDuration = Duration(seconds: 60);

  static const Duration animationDuration = Duration(milliseconds: 300);

  static const Duration fastAnimationDuration = Duration(milliseconds: 200);

  static const double maxMobileWidth = 150;
  static const double maxTabletWidth = 280;
  static const double maxDesktopWidth = 375;

  static const int featuredCarsCount = 7;
  static const int recentCarsCount = 10;
  static const int carouselItemCount = 3;
  static const int carsPerItem = 4;
}
