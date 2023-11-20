import 'package:auto_titanic/res/res.dart';
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
