part of '../common_controller.dart';

mixin CommonAPIMixin {
  CommonController get _controller => Get.find<CommonController>();

  HomeController? get _homeController {
    if (Get.isRegistered<HomeController>()) {
      return Get.find<HomeController>();
    }
    return null;
  }

  Future<String?> uploadImage({
    required String path,
  }) =>
      _controller._viewModel.uploadImage(path: path);

  Future<void> getBrands() async {
    _controller.modelList.clear();
    _controller.brandsList = await _controller._viewModel.getBrands(_controller.selectedVehicle ?? Vehicle.cars);

    if (Get.isRegistered<HomeController>()) {}

    _controller.update([BrandCard.updateId]);
    _homeController?.update([FilterSection.updateId]);
  }

  Future<void> getModels(String brandId) async {
    _controller.modelList = await _controller._viewModel.getModels(brandId);
    _homeController?.update([FilterSection.updateId]);
  }

  Future<List<CountryModel>> getCountries() => _controller._viewModel.getCountries();

  Future<List<CityModel>> getCities(String countryId) => _controller._viewModel.getCities(countryId);
}
