part of '../common_controller.dart';

mixin CommonAPIMixin {
  CommonController get _controller => Get.find<CommonController>();

  Future<String?> uploadImage({
    required String path,
  }) =>
      _controller._viewModel.uploadImage(path: path);

  Future<void> getVehicle() => _controller._viewModel.getVehicle(_controller.selectedVehicle ?? Vehicle.cars);
}
