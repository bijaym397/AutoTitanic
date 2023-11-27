import 'dart:math';

import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension NullString on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;
}

extension StringExtension on String {
  String get svgPath => kIsWeb ? replaceAll('assets/', '') : this;
}

extension ListCombine<T> on Iterable<T> {
  Iterable<T> separate(
    BuildContext context,
    T Function(BuildContext, int) separateBuilder,
  ) {
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
      case Vehicle.motorHomes:
      case Vehicle.caravans:
      case Vehicle.trucks:
      case Vehicle.farms:
      case Vehicle.plants:
      case Vehicle.parts:
        return NavVehicle(label: label);
      case Vehicle.carRentals:
        // case Vehicle.safetyCentre:
        return NavService(label: label);
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
      case Vehicle.motorHomes:
      case Vehicle.caravans:
      case Vehicle.trucks:
        return '$prefix ${vehicle.label.toLowerCase()}';
      case Vehicle.farms:
        return '$prefix farm machinery';
      case Vehicle.plants:
        return '$prefix plant machinery';
      case Vehicle.parts:
        return '$prefix parts';
      case Vehicle.carRentals:
        // case Vehicle.safetyCentre:
        return '';
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
  Duration get duration => [
        const Duration(seconds: 4),
        const Duration(seconds: 3),
        const Duration(seconds: 5)
      ].random;
}
