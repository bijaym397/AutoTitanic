part of '../home_controller.dart';

mixin HomeAPIMixin {
  HomeController get _controller => Get.find<HomeController>();

  CommonController get _commonController => Get.find<CommonController>();

  Future<void> addVehicle() => _controller._viewModel.addVehicle(vehicle: _commonController.selectedVehicle ?? Vehicle.cars);

  Future<void> resultCount() async {
    var count = await _controller._viewModel.resultCount(
      country: _controller.selectedFilterCountry?.label,
      makeId: _controller.selectedFilterBrand?.id,
      modelId: _controller.selectedFilterModel?.id,
      minPrice: _controller.selectedFilterMinPrice?.toInt(),
      maxPrice: _controller.selectedFilterMaxPrice?.toInt(),
    );
  }

  Future<void> getCountries() async {
    _controller.cities.clear();
    _controller.countries = await _commonController.getCountries();
    _controller.update([FilterSection.updateId, AdvanceSearchView.updateId, SellVehicleLocationView.updateId]);
  }

  Future<void> getCities() async {
    if (_controller.selectedCountry == null) {
      return;
    }
    _controller.cities = await _commonController.getCities(_controller.selectedCountry!.id);
    _controller.update([AdvanceSearchView.updateId, SellVehicleLocationView.updateId]);
  }
}
