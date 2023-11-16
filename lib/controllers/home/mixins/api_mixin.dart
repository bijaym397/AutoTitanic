part of '../home_controller.dart';

mixin HomeAPIMixin {
  HomeController get _controller => Get.find<HomeController>();

  Future<void> getVehicle() => _controller._viewModel.getVehicle();
}
