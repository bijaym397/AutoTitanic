import 'package:auto_titanic/res/res.dart';

enum RequestType {
  get,
  post,
  put,
  patch,
  delete,
  upload;
}

enum AppFlavor {
  dev,
  prod;
}

enum Vehicle {
  cars(AppStrings.cars),
  vans(AppStrings.vans),
  bikes(AppStrings.bikes),
  motorHomes(AppStrings.motorHomes),
  caravans(AppStrings.caravans),
  trucks(AppStrings.trucks),
  farms(AppStrings.farms),
  plants(AppStrings.plants),
  parts(AppStrings.partsAccessories),
  carRentals(AppStrings.carRentals),
  safetyCentre(AppStrings.safetyCentre);

  const Vehicle(this.label);
  final String label;
}
