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
  motorAndCaravans(AppStrings.motorAndCaravans, AppRoutes.motorAndCaravans),
  trucks(AppStrings.trucks, AppRoutes.trucks),
  farms(AppStrings.farms, AppRoutes.farms),
  plants(AppStrings.plants, AppRoutes.plants),
  carRentals(AppStrings.carRentals, AppRoutes.carRentals),
  parts(AppStrings.partsAccessories, AppRoutes.parts);
  // safetyCentre(AppStrings.safetyCentre, AppRoutes.safetyCentre);

  factory Vehicle.fromRoute(String route) =>
      <String, Vehicle>{
        Vehicle.cars.route: Vehicle.cars,
        Vehicle.vans.route: Vehicle.vans,
        Vehicle.bikes.route: Vehicle.bikes,
        Vehicle.motorAndCaravans.route: Vehicle.motorAndCaravans,
        Vehicle.trucks.route: Vehicle.trucks,
        Vehicle.farms.route: Vehicle.farms,
        Vehicle.plants.route: Vehicle.plants,
        Vehicle.parts.route: Vehicle.parts,
        Vehicle.carRentals.route: Vehicle.carRentals,
        // Vehicle.safetyCentre.route: Vehicle.safetyCentre,
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
    AppStrings.instagram,
    AppColors.instagram,
    AssetConstants.instagram,
  ),
  facebook(
    AppStrings.facebook,
    AppColors.facebook,
    AssetConstants.facebook,
  ),
  twitter(
    AppStrings.twitter,
    AppColors.twitter,
    AssetConstants.twitter,
  ),
  youtube(
    AppStrings.youtube,
    AppColors.youtube,
    AssetConstants.youtube,
  );

  const Social(
    this.label,
    this.color,
    this.icon,
  );
  final String label;
  final Color color;
  final String icon;
}

enum FilterType {
  expandable,
  expandableWithOptions,
  popup,
  radio,
  input,
  checkbox;
}

enum VehicleFilter {
  make(AppStrings.make, FilterType.expandable),
  model(AppStrings.model, FilterType.expandable),
  modelVariant(AppStrings.modelVariant, FilterType.expandable),
  price(AppStrings.price, FilterType.expandableWithOptions),
  year(AppStrings.year, FilterType.expandableWithOptions),
  mileage(AppStrings.mileage, FilterType.expandable),
  gearbox(AppStrings.gearbox, FilterType.popup),
  fuelType(AppStrings.fuelType, FilterType.popup),
  bodyType(AppStrings.bodyType, FilterType.popup),
  engineSize(AppStrings.engineSize, FilterType.expandable),
  enginePower(AppStrings.enginePower, FilterType.expandable),
  privateAndTrade(AppStrings.privateAndTrade, FilterType.popup),
  door(AppStrings.door, FilterType.popup),
  color(AppStrings.color, FilterType.popup),
  seat(AppStrings.seat, FilterType.expandable),
  bootspace(AppStrings.bootSpace, FilterType.popup),
  acceleration(AppStrings.acceleration, FilterType.popup),
  annualTax(AppStrings.annualTax, FilterType.popup),
  drivetrain(AppStrings.drivetrain, FilterType.popup),
  fuelConsumption(AppStrings.fuelConsumption, FilterType.popup),
  insuranceGroup(AppStrings.insuranceGroup, FilterType.popup),
  co2Emission(AppStrings.co2Emission, FilterType.expandable),
  category(AppStrings.category, FilterType.radio),
  keywords(AppStrings.keywords, FilterType.input),
  more(AppStrings.more, FilterType.checkbox);

  const VehicleFilter(this.label, this.filterType);
  final String label;
  final FilterType filterType;
}

enum GearType {
  manual(0, AppStrings.manual),
  automatic(1, AppStrings.automatic),
  unlisted(2, AppStrings.unlisted);

  factory GearType.fromValue(int data) =>
      <int, GearType>{
        GearType.manual.value: GearType.manual,
        GearType.automatic.value: GearType.automatic,
        GearType.unlisted.value: GearType.unlisted,
      }[data] ??
      GearType.unlisted;

  const GearType(this.value, this.label);
  final int value;
  final String label;
}

enum FuelType {
  petrol(0, AppStrings.petrol),
  diesel(1, AppStrings.diesel),
  electric(2, AppStrings.electric);

  factory FuelType.fromValue(int data) =>
      <int, FuelType>{
        FuelType.petrol.value: FuelType.petrol,
        FuelType.diesel.value: FuelType.diesel,
        FuelType.electric.value: FuelType.electric,
      }[data] ??
      FuelType.petrol;

  const FuelType(this.value, this.label);
  final int value;
  final String label;
}
