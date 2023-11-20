import 'package:auto_titanic/utils/navigators/app_pages.dart';
import 'package:get/get.dart';

abstract class RouteManagement {
  /// Go to the SignIn Screen
  static void goToSignIn() {
    Get.offAllNamed<void>(
      AppRoutes.auth,
    );
  }

  /// Go to the Home Screen
  static void goToHome() {
    Get.offAllNamed<void>(
      AppRoutes.home,
    );
  }
}
