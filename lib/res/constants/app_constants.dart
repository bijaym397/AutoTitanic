/// `AppConstants` is a singleton class with all static variables.
///
/// It contains all constants that are to be used within the project
///
class AppConstants {
  const AppConstants._();

  static const String appName = 'AutoTitanic';

  static const Duration timeOutDuration = Duration(seconds: 60);

  static const Duration animationDuration = Duration(milliseconds: 300);

  static const double maxMobileWidth = 480;
  static const double maxTabletWidth = 768;
  static const double maxDesktopWidth = 1024;
}
