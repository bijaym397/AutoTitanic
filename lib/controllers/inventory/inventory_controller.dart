import 'dart:math';

import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController {
  InventoryController(this._viewModel);

  final InventoryViewModel _viewModel;

  InventoryModel get inventory => InventoryModel(
        make: 'Nissan',
        model: 'Micra',
        variant: 'TDi 4x4 5dr',
        price: 2499,
        images: List.generate(Random().nextInt(4) + 2, (index) => AssetConstants.car),
        features: ['12 months warranty', '2 keys'],
        gearType: GearType.automatic,
        fuelType: FuelType.diesel,
        bodyType: 'Hatchback',
        distance: 34670,
        seller: 'Joys Motors',
        address: const AddressModel(street: '12', city: 'Heywood'),
        rating: 4.3,
        reviews: 1200,
        labels: [
          const LabelModel(label: 'Lower price', color: Colors.teal),
          const LabelModel(label: 'Brand new', color: Colors.blue),
        ],
      );
}
