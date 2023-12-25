part of '../home_controller.dart';

mixin HomeAPIMixin {
  HomeController get _controller => Get.find<HomeController>();

  CommonController get _commonController => Get.find<CommonController>();

  Future<void> addVehicle() => _controller._viewModel.addVehicle(vehicle: _commonController.selectedVehicle ?? Vehicle.cars);

  Future<void> getBrands() async {
    _controller.modelList.clear();
    _controller.brandsList = await _controller._viewModel.getBrands(_commonController.selectedVehicle ?? Vehicle.cars);

    _controller.isBrandsExpanded = false;
    _controller.update([BrandCard.updateId, FilterSection.updateId]);
  }

  Future<void> getModels(String brandId) async {
    _controller.modelList = await _controller._viewModel.getModels(brandId);
    _controller.update([FilterSection.updateId]);
  }

  Future<void> resultCount() async {
    var count = await _controller._viewModel.resultCount(
      country: _controller.selectedFilterCountry?.split(' ').last.toLowerCase(),
      modelId: _controller.selectedFilterBrand?.id,
      minPrice: _controller.selectedFilterMinPrice?.toInt(),
      maxPrice: _controller.selectedFilterMaxPrice?.toInt(),
    );
  }
}
