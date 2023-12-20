part of '../home_controller.dart';

mixin HomeAPIMixin {
  HomeController get _controller => Get.find<HomeController>();

  CommonController get _commonController => Get.find<CommonController>();

  Future<void> addVehicle() => _controller._viewModel.addVehicle(vehicle: _commonController.selectedVehicle ?? Vehicle.cars);
}
