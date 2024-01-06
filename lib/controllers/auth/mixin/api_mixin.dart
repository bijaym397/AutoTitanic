part of '../auth_controller.dart';

mixin AuthAPIMixin {
  AuthController get _controller => Get.find<AuthController>();

  CommonController get _commonController => Get.find<CommonController>();

  Future<void> getCountries() async {
    _controller.countries = await _commonController.getCountries();
    _controller.update([RegisterView.updateId]);
  }
}
