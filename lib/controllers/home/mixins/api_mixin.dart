part of '../home_controller.dart';

mixin HomeAPIMixin {
  HomeController get _controller => Get.find<HomeController>();

  CommonController get _commonController => Get.find<CommonController>();

  Future<void> addVehicle() => _controller._viewModel.addVehicle(vehicle: _commonController.selectedVehicle ?? Vehicle.cars);

  Future<void> getBrands() async {
    var brands = await _controller._viewModel.getBrands(_commonController.selectedVehicle ?? Vehicle.cars);

    _controller.brandsList = [...brands];
    _controller.isBrandsExpanded = false;
    _controller.update([BrandCard.updateId, FilterSection.updateId]);
  }

  Future<void> getModels(String brandId) async {
    var models = await _controller._viewModel.getModels(brandId);
  }
}
