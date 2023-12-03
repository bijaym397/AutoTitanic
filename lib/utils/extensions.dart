import 'dart:convert';
import 'dart:math';

import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension NullString on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;
}

extension StringExtension on String {
  String get svgPath => kIsWeb ? replaceAll('assets/', '') : this;

  Uint8List get strigToUnit8List {
    var list = Uint8List.fromList(
      List.from(jsonDecode(this) as List),
    );
    return list;
  }
}

extension ListCombine<T> on Iterable<T> {
  Iterable<T> separate(
    BuildContext context,
    T Function(BuildContext, int) separateBuilder,
  ) {
    if (isEmpty) {
      return [];
    }
    var result = <T>[];
    for (var i = 0; i < length - 1; i++) {
      result.add(elementAt(i));
      result.add(separateBuilder(context, i));
    }
    result.add(last);
    return result;
  }

  T get random => toList()[Random().nextInt(length)];
}

extension VehicleExtension on Vehicle {
  NavModel get model {
    switch (this) {
      case Vehicle.cars:
      case Vehicle.vans:
      case Vehicle.bikes:
      case Vehicle.motorAndCaravans:
      case Vehicle.trucks:
      case Vehicle.farms:
      case Vehicle.plants:
      case Vehicle.parts:
      case Vehicle.carRentals:
        return NavVehicle(label: label);
      // case Vehicle.safetyCentre:
      // return NavService(label: label);
    }
  }

  bool get showIcon => model.showIcon;
}

extension ScreenExtension on num {
  double get ph => Get.height * this;

  double get pw => Get.width * this;

  EdgeInsets get pt => EdgeInsets.only(top: toDouble());
}

extension HoverItemExtension on HoverItem {
  String getLabel(Vehicle vehicle) {
    switch (vehicle) {
      case Vehicle.cars:
      case Vehicle.vans:
      case Vehicle.bikes:
      case Vehicle.motorAndCaravans:
      case Vehicle.trucks:
      case Vehicle.carRentals:
        return '$prefix ${vehicle.label.toLowerCase()}';
      case Vehicle.farms:
        return '$prefix farm machinery';
      case Vehicle.plants:
        return '$prefix plant machinery';
      case Vehicle.parts:
        return '$prefix parts';
      // case Vehicle.safetyCentre:
      // return '';
    }
  }
}

extension BorderExtension on Border {
  Border withSide({
    BorderSide? left,
    BorderSide? top,
    BorderSide? right,
    BorderSide? bottom,
  }) =>
      Border(
        left: left ?? this.left,
        top: top ?? this.top,
        right: right ?? this.right,
        bottom: bottom ?? this.bottom,
      );
}

extension CarouselControllerExtension on CarouselController {
  Duration get duration => [const Duration(seconds: 8), const Duration(seconds: 10), const Duration(seconds: 12)].random;
}

extension NumberExtension on num {
  String get formattedPrice => NumberFormat.currency(symbol: '£', decimalDigits: 0).format(this);

  String get formattedDistance => NumberFormat('###,###').format(this);
}

extension ConstraintExtension on BoxConstraints {
  bool get isDesktopView => maxWidth > AppConstants.maxDesktopWidth;
}

extension FilterTypeExtension on FilterType {
  bool get isExpandable {
    switch (this) {
      case FilterType.popup:
        return false;
      case FilterType.expandable:
      case FilterType.expandableWithOptions:
      case FilterType.input:
      case FilterType.checkbox:
        return true;
    }
  }
}

extension VehicleFilterExtension on VehicleFilter {
  String get first {
    switch (this) {
      case VehicleFilter.year:
        return 'From';
      case VehicleFilter.price:
      case VehicleFilter.mileage:
      case VehicleFilter.engineSize:
      case VehicleFilter.enginePower:
      case VehicleFilter.seat:
        return 'Min';
      case VehicleFilter.make:
      case VehicleFilter.model:
      case VehicleFilter.modelVariant:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyType:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.door:
      case VehicleFilter.color:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.co2Emission:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
        return '';
    }
  }

  String get last {
    switch (this) {
      case VehicleFilter.year:
        return 'To';
      case VehicleFilter.price:
      case VehicleFilter.mileage:
      case VehicleFilter.engineSize:
      case VehicleFilter.enginePower:
      case VehicleFilter.seat:
        return 'Max';
      case VehicleFilter.make:
      case VehicleFilter.model:
      case VehicleFilter.modelVariant:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyType:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.door:
      case VehicleFilter.color:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.co2Emission:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
        return '';
    }
  }

  List<num> get minList {
    switch (this) {
      case VehicleFilter.year:
        return [2023, 2022, 2021, 2020, 2019];
      case VehicleFilter.price:
        return [0, 500, 1000, 1500, 2000];
      case VehicleFilter.mileage:
        return [100, 500, 1000, 5000];
      case VehicleFilter.engineSize:
        return [0, 1, 1.2, 1.4, 1.6];
      case VehicleFilter.enginePower:
        return [0, 50, 100, 150];
      case VehicleFilter.seat:
        return [1, 2, 3, 4, 5, 6, 7, 8];
      case VehicleFilter.make:
      case VehicleFilter.model:
      case VehicleFilter.modelVariant:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyType:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.door:
      case VehicleFilter.color:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.co2Emission:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
        return [];
    }
  }

  List<num> get maxList {
    switch (this) {
      case VehicleFilter.year:
        return [2023, 2022, 2021, 2020, 2019];
      case VehicleFilter.price:
        return [0, 500, 1000, 1500, 2000];
      case VehicleFilter.mileage:
        return [100, 500, 1000, 5000];
      case VehicleFilter.engineSize:
        return [0, 1, 1.2, 1.4, 1.6];
      case VehicleFilter.enginePower:
        return [0, 50, 100, 150];
      case VehicleFilter.seat:
        return [1, 2, 3, 4, 5, 6, 7, 8];
      case VehicleFilter.make:
      case VehicleFilter.model:
      case VehicleFilter.modelVariant:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyType:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.door:
      case VehicleFilter.color:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.co2Emission:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
        return [];
    }
  }

  List<String> get toggleLabels {
    switch (this) {
      case VehicleFilter.year:
        return [AppStrings.selectYear, AppStrings.brandNew];
      case VehicleFilter.more:
        return [
          AppStrings.wheelChair,
          AppStrings.manufacturerApproved,
          AppStrings.irelandAdverts,
        ];
      case VehicleFilter.price:
      case VehicleFilter.mileage:
      case VehicleFilter.engineSize:
      case VehicleFilter.enginePower:
      case VehicleFilter.seat:
      case VehicleFilter.make:
      case VehicleFilter.model:
      case VehicleFilter.modelVariant:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyType:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.door:
      case VehicleFilter.color:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.co2Emission:
      case VehicleFilter.keywords:
        return [];
    }
  }
}
