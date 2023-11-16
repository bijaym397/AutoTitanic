import 'package:auto_titanic/models/nav/nav.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:get/get.dart';

extension NullString on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;
}

extension VehicleExtension on Vehicle {
  NavModel get model {
    switch (this) {
      case Vehicle.cars:
      case Vehicle.vans:
      case Vehicle.bikes:
      case Vehicle.motorHomes:
      case Vehicle.caravans:
      case Vehicle.trucks:
      case Vehicle.farms:
      case Vehicle.plants:
      case Vehicle.parts:
        return NavVehicle(label: label);
      case Vehicle.carRentals:
      case Vehicle.safetyCentre:
        return NavService(label: label);
    }
  }

  bool get showIcon => model.showIcon;
}

extension ScreenExtension on num {
  double get ph => Get.height * this;

  double get pw => Get.width * this;
}
