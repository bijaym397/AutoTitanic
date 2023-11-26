import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/widgets.dart';

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
  cars(AppStrings.cars, AppRoutes.cars),
  vans(AppStrings.vans, AppRoutes.vans),
  bikes(AppStrings.bikes, AppRoutes.bikes),
  motorHomes(AppStrings.motorHomes, AppRoutes.motorHomes),
  caravans(AppStrings.caravans, AppRoutes.caravans),
  trucks(AppStrings.trucks, AppRoutes.trucks),
  farms(AppStrings.farms, AppRoutes.farms),
  plants(AppStrings.plants, AppRoutes.plants),
  parts(AppStrings.partsAccessories, AppRoutes.parts),
  carRentals(AppStrings.carRentals, AppRoutes.carRentals),
  safetyCentre(AppStrings.safetyCentre, AppRoutes.safetyCentre);

  factory Vehicle.fromRoute(String route) =>
      <String, Vehicle>{
        Vehicle.cars.route: Vehicle.cars,
        Vehicle.vans.route: Vehicle.vans,
        Vehicle.bikes.route: Vehicle.bikes,
        Vehicle.motorHomes.route: Vehicle.motorHomes,
        Vehicle.caravans.route: Vehicle.caravans,
        Vehicle.trucks.route: Vehicle.trucks,
        Vehicle.farms.route: Vehicle.farms,
        Vehicle.plants.route: Vehicle.plants,
        Vehicle.parts.route: Vehicle.parts,
        Vehicle.carRentals.route: Vehicle.carRentals,
        Vehicle.safetyCentre.route: Vehicle.safetyCentre,
      }[route] ??
      Vehicle.cars;

  const Vehicle(this.label, this.route);
  final String label;
  final String route;

  static List<Vehicle> get visibleVehicles {
    var maxWidth = Dimens.screenWidth;
    if (maxWidth >= AppConstants.maxDesktopWidth) {
      return Vehicle.values;
    }
    if (maxWidth >= AppConstants.maxTabletWidth) {
      return Vehicle.values.where((e) => e.showIcon).toList();
    }
    return [];
  }
}

enum HoverItem {
  used('Used'),
  brandNew('New'),
  sell('Sell your');

  const HoverItem(this.prefix);
  final String prefix;
}

enum Social {
  instagram(
      AppStrings.instagram, AppColors.instagram, AssetConstants.instagram),
  facebook(AppStrings.facebook, AppColors.facebook, AssetConstants.facebook),
  twitter(AppStrings.twitter, AppColors.twitter, AssetConstants.twitter),
  youtube(AppStrings.youtube, AppColors.youtube, AssetConstants.youtube);

  const Social(
    this.label,
    this.color,
    this.icon,
  );
  final String label;
  final Color color;
  final String icon;
}

enum VehicleFilter {
  year(AppStrings.year),
  make(AppStrings.make),
  model(AppStrings.model),
  bodyStyle(AppStrings.bodyStyle),
  carCondition(AppStrings.carCondition),
  mileage(AppStrings.mileage),
  gearbox(AppStrings.gearbox),
  drivetrain(AppStrings.drivetrain),
  engineSize(AppStrings.engineSize),
  fuelType(AppStrings.fuelType),
  exteriorColor(AppStrings.exteriorColor),
  bodyType(AppStrings.bodyType),
  door(AppStrings.door),
  driverPosition(AppStrings.driverPosition),
  seat(AppStrings.seat),
  bootSpace(AppStrings.bootSpace),
  acceleration(AppStrings.acceleration),
  co2Emission(AppStrings.co2Emission),
  color(AppStrings.color),
  cc(AppStrings.cc),
  berth(AppStrings.berth),
  beltedSeats(AppStrings.beltedSeats),
  endLayout(AppStrings.endLayout),
  bedroomLayout(AppStrings.bedroomLayout),
  length(AppStrings.length),
  axles(AppStrings.axles),
  mtplm(AppStrings.mtplm),
  category(AppStrings.category),
  axleConfig(AppStrings.axleConfig),
  enginePower(AppStrings.enginePower),
  gvw(AppStrings.gvw),
  cabType(AppStrings.cabType),
  gtw(AppStrings.gtw),
  hoursUsed(AppStrings.hoursUsed),
  serviceGarage(AppStrings.serviceGarage),
  privateDealer(AppStrings.privateDealer),
  city(AppStrings.city),
  transmission(AppStrings.transmission),
  keyFeatures(AppStrings.keyFeatures),
  subCategory(AppStrings.subCategory);

  const VehicleFilter(this.label);
  final String label;
}
