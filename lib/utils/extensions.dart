import 'dart:convert';
import 'dart:math';

import 'package:auto_titanic/controllers/controllers.dart';
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

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> removeNullValues() {
    var result = <String, dynamic>{};
    for (var entry in entries) {
      var k = entry.key;
      if (entry.value != null) {
        if (entry.value.runtimeType.toString().contains('Map')) {
          result[k] = (entry.value as Map<String, dynamic>).removeNullValues();
        } else {
          result[k] = entry.value;
        }
      }
    }
    return result;
  }
}

extension TECExtension on TextEditingController {
  bool get isEmpty => text.trim().isEmpty;

  bool get isNotEmpty => text.trim().isNotEmpty;
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

extension ResponseExtension on ResponseModel {
  List<dynamic> get bodyList => (jsonDecode(data) as Map<String, dynamic>?)?['data']?['items'] as List<dynamic>? ?? [];
}

extension ContextExtension on BuildContext {
  bool get isDesktopView => width > AppConstants.maxTabletWidth;

  bool get isTabletView => width > AppConstants.maxMobileWidth && width <= AppConstants.maxTabletWidth;

  bool get isMobileView => width <= AppConstants.maxMobileWidth;

  double? get fieldWidth {
    if (isDesktopView) {
      return 0.3.pw;
    }
    if (isTabletView) {
      return 0.4.pw;
    }
    return null;
  }

  double get screenWidth {
    if (isDesktopView) {
      return 0.7.pw;
    }
    if (isTabletView) {
      return 0.8.pw;
    }
    return 0.9.pw;
  }

  Size? get size => (findRenderObject() as RenderBox?)?.size;
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

  String get path => route.replaceAll('/', '');
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

  String get path => route.replaceAll('/', '');
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
  String formattedPrice(String curreny) => NumberFormat.currency(symbol: curreny, decimalDigits: 0).format(this);

  String get formattedDistance => NumberFormat('###,###').format(this);

  String get visibleDistance => '$formattedDistance miles';
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
      case VehicleFilter.variant:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyType:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.door:
      case VehicleFilter.exteriorColor:
      case VehicleFilter.interiorColor:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.co2Emission:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
      case VehicleFilter.condition:
      case VehicleFilter.bodyStyle:
      case VehicleFilter.driverPosition:
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
      case VehicleFilter.variant:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyType:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.door:
      case VehicleFilter.exteriorColor:
      case VehicleFilter.interiorColor:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.co2Emission:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
      case VehicleFilter.condition:
      case VehicleFilter.bodyStyle:
      case VehicleFilter.driverPosition:
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
      case VehicleFilter.variant:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyType:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.door:
      case VehicleFilter.exteriorColor:
      case VehicleFilter.interiorColor:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.co2Emission:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
      case VehicleFilter.condition:
      case VehicleFilter.bodyStyle:
      case VehicleFilter.driverPosition:
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
      case VehicleFilter.variant:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyType:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.door:
      case VehicleFilter.exteriorColor:
      case VehicleFilter.interiorColor:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.co2Emission:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
      case VehicleFilter.condition:
      case VehicleFilter.bodyStyle:
      case VehicleFilter.driverPosition:
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
      case VehicleFilter.variant:
      case VehicleFilter.gearbox:
      case VehicleFilter.fuelType:
      case VehicleFilter.bodyType:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.door:
      case VehicleFilter.exteriorColor:
      case VehicleFilter.interiorColor:
      case VehicleFilter.bootspace:
      case VehicleFilter.acceleration:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.fuelConsumption:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.co2Emission:
      case VehicleFilter.keywords:
      case VehicleFilter.condition:
      case VehicleFilter.bodyStyle:
      case VehicleFilter.driverPosition:
        return [];
    }
  }

  List<DropDownModel> get sellDropDownList {
    switch (this) {
      case VehicleFilter.mileage:
      case VehicleFilter.bodyType:
        return [];
      case VehicleFilter.year:
        return AppConstants.yearList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.engineSize:
        return AppConstants.engineSizeList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.seat:
        return AppConstants.seatsList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.make:
        return Get.find<HomeController>()
            .brandsList
            .map(
              (e) => DropDownModel(label: e.label, id: e.id),
            )
            .toList();
      case VehicleFilter.model:
        return Get.find<HomeController>()
            .modelList
            .map(
              (e) => DropDownModel(label: e.label, id: e.id),
            )
            .toList();
      case VehicleFilter.variant:
        return AppConstants.variantList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.gearbox:
        return AppConstants.gearTypeList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.fuelType:
        return AppConstants.fuelTypeList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.door:
        return AppConstants.doorList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.exteriorColor:
      case VehicleFilter.interiorColor:
        return AppConstants.colorsList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.bootspace:
        return AppConstants.bootspaceList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.acceleration:
        return AppConstants.accelerationList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.fuelConsumption:
        return AppConstants.fuelConsumptionList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.co2Emission:
        return AppConstants.co2EmissionList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.bodyStyle:
        return AppConstants.bodyStyle.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.condition:
        return AppConstants.carConditions.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.driverPosition:
        return AppConstants.driverPositionList.map((e) => DropDownModel(label: e)).toList();
      case VehicleFilter.price:
      case VehicleFilter.privateAndTrade:
      case VehicleFilter.enginePower:
      case VehicleFilter.annualTax:
      case VehicleFilter.drivetrain:
      case VehicleFilter.insuranceGroup:
      case VehicleFilter.keywords:
      case VehicleFilter.more:
        return [];
    }
  }
}

extension AdvanceSearchExtension on AdvanceSearchType {
  String label(Vehicle vehicle) {
    switch (this) {
      case AdvanceSearchType.allVehicle:
        return 'All ${vehicle.label}';
      case AdvanceSearchType.newVehicle:
        return 'New ${vehicle.label}';
    }
  }
}
