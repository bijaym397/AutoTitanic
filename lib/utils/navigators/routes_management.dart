import 'package:auto_titanic/utils/utils.dart';
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

  static void goToListing(Vehicle vehicle) {
    Get.toNamed(
      vehicle.route,
      arguments: vehicle,
    );
  }
}
