import 'dart:math';

import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'mixins/api_mixin.dart';

class InventoryController extends GetxController with InventoryAPIMixin {
  InventoryController(this._viewModel);

  final InventoryViewModel _viewModel;

  InventoryModel get inventory => InventoryModel(
        type: Vehicle.cars,
        make: 'Nissan',
        model: 'Micra',
        variant: 'TDi 4x4 5dr',
        currency: '\$',
        condition: 'New',
        price: 2499,
        year: '2021 (18 reg)',
        capacity: 1.2,
        media: List.generate(Random().nextInt(6) + 2, (_) => AssetConstants.car),
        features: ['12 months warranty', '2 keys'],
        gearType: GearType.automatic,
        fuelType: FuelType.diesel,
        bodyType: 'Hatchback',
        power: '145BHP',
        distance: 346700,
        seller: 'Joys Motors',
        address: const AddressModel(
          street: '12',
          city: 'Heywood',
          state: 'Greater Manchester',
          country: 'England',
        ),
        rating: 4.3,
        reviews: 1200,
        labels: [
          const LabelModel(label: 'Lower price', color: Colors.teal),
          const LabelModel(label: 'Brand new', color: Colors.blue),
        ],
      );

  List<bool> yearToggleList = [true, false];

  List<InventoryModel> vehicles = [];

  final RxList<String> _selectedMoreFilters = <String>[].obs;
  List<String> get selectedMoreFilters => _selectedMoreFilters;
  set selectedMoreFilters(List<String> value) => _selectedMoreFilters.value = value;

  final Rx<SortBy> _selectedSortBy = SortBy.relevance.obs;
  SortBy get selectedSortBy => _selectedSortBy.value;
  set selectedSortBy(SortBy value) => _selectedSortBy.value = value;

  final RxInt _selectedPageLimit = 25.obs;
  int get selectedPageLimit => _selectedPageLimit.value;
  set selectedPageLimit(int value) => _selectedPageLimit.value = value;

  int pageNumber = 1;
}
