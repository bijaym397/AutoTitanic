import 'package:auto_titanic/utils/utils.dart';
import 'package:get/get.dart';

abstract class RouteManagement {
  /// Go to the Login Screen
  static void goToLogin() {
    Get.toNamed<void>(
      AppRoutes.login,
    );
  }

  /// Go to the Register Screen
  static void goToRegister() {
    Get.toNamed<void>(
      AppRoutes.register,
    );
  }

  /// Go to the Register Screen
  static void goToForgotPassword() {
    Get.toNamed<void>(
      AppRoutes.forgotPassword,
    );
  }

  /// Go to the Home Screen
  static void goToHome() {
    Get.offAllNamed<void>(
      AppRoutes.home,
    );
  }

  static void goToListing(Vehicle vehicle, HoverItem hoverItem) {
    Get.toNamed(
      '${vehicle.route}${hoverItem.route}',
    );
  }

  static void goToSearch(Vehicle vehicle) {
    Get.toNamed(
      '${AppRoutes.search}${vehicle.route}',
      arguments: vehicle,
    );
  }

  static void goToAdvanceSearch() {
    Get.toNamed(
      AppRoutes.advanceSearch,
    );
  }
}
