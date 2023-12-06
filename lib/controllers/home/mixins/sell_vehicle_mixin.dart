part of '../home_controller.dart';

mixin SellVehicleMixin {
  HomeController get _controller => Get.find<HomeController>();

  bool get isNextButtonEnabled => [
        _controller.selectedVehicleCategory,
        _controller.selectedCountry,
        _controller.selectedState,
        _controller.selectedSellerType
      ].every((e) => e != null);

  void onChangeSellPage([bool fromLocationView = false]) {
    _controller.showLocationPage = fromLocationView;
    _controller.update([SellVehicleView.updateId]);
  }

  void onCategoryChange(Vehicle? vehicle) {
    _controller.selectedVehicleCategory = vehicle;
    _controller.update([SellVehicleLocationView.updateId]);
  }

  void onCountryChanged(String country) {
    _controller.selectedCountry = country;
    _controller.update([SellVehicleLocationView.updateId]);
  }

  void onStateChanged(String? state) {
    _controller.selectedState = state ?? '';
    _controller.update([SellVehicleLocationView.updateId]);
  }

  void onSellerTypeChange(SellerType? type) {
    _controller.selectedSellerType = type;
    _controller.update([SellVehicleLocationView.updateId]);
  }
}
