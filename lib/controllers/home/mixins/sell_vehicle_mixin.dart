part of '../home_controller.dart';

mixin SellVehicleMixin {
  HomeController get _controller => Get.find<HomeController>();

  bool get isNextButtonEnabled =>
      [_controller.selectedVehicleCategory, _controller.selectedCountry, _controller.selectedState]
          .every((e) => e != null && e.toString().trim().isNotEmpty) &&
      _controller.selectedImages.length >= 5 &&
      (_controller.vehicleVideoTEC.isEmpty || (_controller.vehicleVideoTEC.isNotEmpty && _controller.videoLinkError == null));

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

  String? videoLinkValidator(String? link) {
    if (link == null || link.trim().isEmpty) {
      return null;
    }

    return _controller.videoLinkError;
  }

  void onVideoLinkChanged(String? link) {
    _controller.debouncer.run(() async {
      _controller.isValidatingLink = true;
      var isValid = await Validators.isValidUrl(link!);
      if (isValid) {
        _controller.videoLinkError = null;
      } else {
        _controller.videoLinkError = 'Invalid link';
      }
      _controller.isValidatingLink = false;
      _controller.update([SellVehicleLocationView.updateId]);
    });
  }

  DropDownModel? sellDetailsValue(VehicleFilter filter) {
    switch (filter) {
      case VehicleFilter.condition:
        if (_controller.selectedCarCondition == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedCarCondition ?? '');
      case VehicleFilter.make:
        if (_controller.selectedMake == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedMake ?? '');
      case VehicleFilter.model:
        if (_controller.selectedModel == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedModel ?? '');
      case VehicleFilter.variant:
        if (_controller.selectedVariant == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedVariant ?? '');
      case VehicleFilter.year:
        if (_controller.selectedYear == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedYear ?? '');
      case VehicleFilter.gearbox:
        if (_controller.selectedGearBox == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedGearBox ?? '');
      case VehicleFilter.fuelType:
        if (_controller.selectedFuelType == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedFuelType ?? '');
      case VehicleFilter.bodyStyle:
        if (_controller.selectedBodyStyle == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedBodyStyle ?? '');
      case VehicleFilter.bodyType:
        if (_controller.selectedBodyType == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedBodyType ?? '');
      case VehicleFilter.engineSize:
        if (_controller.selectedEngineSize == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedEngineSize ?? '');
      case VehicleFilter.door:
        if (_controller.selectedDoor == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedDoor ?? '');
      case VehicleFilter.exteriorColor:
        if (_controller.selectedExteriorColor == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedExteriorColor ?? '');
      case VehicleFilter.interiorColor:
        if (_controller.selectedInteriorColor == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedInteriorColor ?? '');
      case VehicleFilter.seat:
        if (_controller.selectedSeat == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedSeat ?? '');
      case VehicleFilter.driverPosition:
        if (_controller.selectedDriverPosition == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedDriverPosition ?? '');
      case VehicleFilter.bootspace:
        if (_controller.selectedBootSpace == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedBootSpace ?? '');
      case VehicleFilter.acceleration:
        if (_controller.selectedAcceleration == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedAcceleration ?? '');
      case VehicleFilter.fuelConsumption:
        if (_controller.selectedFuelConsumption == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedFuelConsumption ?? '');
      case VehicleFilter.co2Emission:
        if (_controller.selectedCO2Emission == null) {
          return null;
        }
        return DropDownModel(label: _controller.selectedCO2Emission ?? '');
      case VehicleFilter.price:
      case VehicleFilter.mileage:
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
      case VehicleFilter.mileage:
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
