part of '../home_controller.dart';

mixin SellVehicleMixin {
  HomeController get _controller => Get.find<HomeController>();

  bool get isNextButtonEnabled =>
      [_controller.selectedVehicleCategory, _controller.selectedCountry, _controller.selectedState]
          .every((e) => e != null && e.toString().trim().isNotEmpty) &&
      _controller.selectedImages.length > 5;

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

  String? sellDetailsValue(VehicleFilter filter) {
    switch (filter) {
      case VehicleFilter.condition:
        return _controller.selectedCarCondition;
      case VehicleFilter.make:
        return _controller.selectedMake;
      case VehicleFilter.model:
        return _controller.selectedModel;
      case VehicleFilter.variant:
        return _controller.selectedVariant;
      case VehicleFilter.year:
        return _controller.selectedYear;
      case VehicleFilter.gearbox:
        return _controller.selectedGearBox;
      case VehicleFilter.fuelType:
        return _controller.selectedFuelType;
      case VehicleFilter.bodyStyle:
        return _controller.selectedBodyStyle;
      case VehicleFilter.bodyType:
        return _controller.selectedBodyType;
      case VehicleFilter.engineSize:
        return _controller.selectedEngineSize;
      case VehicleFilter.door:
        return _controller.selectedDoor;
      case VehicleFilter.exteriorColor:
        return _controller.selectedExteriorColor;
      case VehicleFilter.interiorColor:
        return _controller.selectedInteriorColor;
      case VehicleFilter.seat:
        return _controller.selectedSeat;
      case VehicleFilter.driverPosition:
        return _controller.selectedDriverPosition;
      case VehicleFilter.bootspace:
        return _controller.selectedBootSpace;
      case VehicleFilter.acceleration:
        return _controller.selectedAcceleration;
      case VehicleFilter.fuelConsumption:
        return _controller.selectedFuelConsumption;
      case VehicleFilter.co2Emission:
        return _controller.selectedCO2Emission;
      case VehicleFilter.price:
        return _controller.sellPriceTEC.text;
      case VehicleFilter.mileage:
        return _controller.sellMileageTEC.text;
      case VehicleFilter.enginePower:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
        return null;
    }
  }

  TextEditingController sellDetailsTEC(VehicleFilter filter) {
    switch (filter) {
      case VehicleFilter.price:
        return _controller.sellPriceTEC;
      case VehicleFilter.mileage:
        return _controller.sellMileageTEC;
      case VehicleFilter.condition:
      case VehicleFilter.make:
      case VehicleFilter.model:
      case VehicleFilter.variant:
      case VehicleFilter.year:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyStyle:
      case VehicleFilter.bodyType:
      case VehicleFilter.engineSize:
      case VehicleFilter.door:
      case VehicleFilter.exteriorColor:
      case VehicleFilter.interiorColor:
      case VehicleFilter.seat:
      case VehicleFilter.driverPosition:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.co2Emission:
      case VehicleFilter.enginePower:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
        return TextEditingController();
    }
  }

  void onDetailChanged(
    VehicleFilter filter, {
    String? data,
    required String updateId,
  }) {
    switch (filter) {
      case VehicleFilter.condition:
        _controller.selectedCarCondition = data;
        break;
      case VehicleFilter.make:
        _controller.selectedMake = data;
        break;
      case VehicleFilter.model:
        _controller.selectedModel = data;
        break;
      case VehicleFilter.variant:
        _controller.selectedVariant = data;
        break;
      case VehicleFilter.year:
        _controller.selectedYear = data;
        break;
      case VehicleFilter.gearbox:
        _controller.selectedGearBox = data;
        break;
      case VehicleFilter.fuelType:
        _controller.selectedFuelType = data;
        break;
      case VehicleFilter.bodyStyle:
        _controller.selectedBodyStyle = data;
        break;
      case VehicleFilter.bodyType:
        _controller.selectedBodyType = data;
        break;
      case VehicleFilter.engineSize:
        _controller.selectedEngineSize = data;
        break;
      case VehicleFilter.door:
        _controller.selectedDoor = data;
        break;
      case VehicleFilter.exteriorColor:
        _controller.selectedExteriorColor = data;
        break;
      case VehicleFilter.interiorColor:
        _controller.selectedInteriorColor = data;
        break;
      case VehicleFilter.seat:
        _controller.selectedSeat = data;
        break;
      case VehicleFilter.driverPosition:
        _controller.selectedDriverPosition = data;
        break;
      case VehicleFilter.bootspace:
        _controller.selectedBootSpace = data;
        break;
      case VehicleFilter.acceleration:
        _controller.selectedAcceleration = data;
        break;
      case VehicleFilter.fuelConsumption:
        _controller.selectedFuelConsumption = data;
        break;
      case VehicleFilter.co2Emission:
        _controller.selectedCO2Emission = data;
        break;
      case VehicleFilter.price:
        // _controller.sellPriceTEC.text = data ?? '';
        break;
      case VehicleFilter.mileage:
        // _controller.sellMileageTEC.text = data ?? '';
        break;
      case VehicleFilter.enginePower:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
        break;
    }
    _controller.update([updateId]);
  }
}
