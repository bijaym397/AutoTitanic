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

  factory Vehicle.fromRoute(String data) =>
      <String, Vehicle>{
        Vehicle.cars.path: Vehicle.cars,
        Vehicle.vans.path: Vehicle.vans,
        Vehicle.bikes.path: Vehicle.bikes,
        Vehicle.motorAndCaravans.path: Vehicle.motorAndCaravans,
        Vehicle.trucks.path: Vehicle.trucks,
        Vehicle.farms.path: Vehicle.farms,
        Vehicle.plants.path: Vehicle.plants,
        Vehicle.parts.path: Vehicle.parts,
        Vehicle.carRentals.path: Vehicle.carRentals,
        // Vehicle.safetyCentre.path: Vehicle.safetyCentre,
      }[data] ??
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
  used('Used', AppRoutes.used),
  brandNew('New', AppRoutes.brandNew),
  sell('Sell your', AppRoutes.sell);

  factory HoverItem.fromRoute(String data) =>
      <String, HoverItem>{
        HoverItem.used.path: HoverItem.used,
        HoverItem.brandNew.path: HoverItem.brandNew,
        HoverItem.sell.path: HoverItem.sell,
      }[data] ??
      HoverItem.used;

  const HoverItem(this.prefix, this.route);
  final String prefix;
  final String route;
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
  input,
  checkbox;
}

enum VehicleFilter {
  make(AppStrings.make, FilterType.popup),
  model(AppStrings.model, FilterType.popup),
  modelVariant(AppStrings.modelVariant, FilterType.popup),
  price(AppStrings.price, FilterType.expandable),
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
  co2Emission(AppStrings.co2Emission, FilterType.popup),
  keywords(AppStrings.keywords, FilterType.input),
  more(AppStrings.more, FilterType.checkbox);

  const VehicleFilter(this.label, this.filterType);
  final String label;
  final FilterType filterType;
}

enum SellerType {
  dealer(AppStrings.dealer),
  private(AppStrings.private);

  const SellerType(this.label);
  final String label;
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
