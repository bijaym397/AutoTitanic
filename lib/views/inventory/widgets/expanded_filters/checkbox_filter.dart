import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckboxExpandedFilter extends StatelessWidget {
  const CheckboxExpandedFilter({
    super.key,
    required this.filter,
  });

  final VehicleFilter filter;

  @override
  Widget build(BuildContext context) => GetX<InventoryController>(
        builder: (controller) => Column(
          mainAxisSize: MainAxisSize.min,
          children: filter.toggleLabels
              .map(
                (e) => AppCheckBoxListTile(
                  value: controller.selectedMoreFilters.contains(e),
                  onChanged: (value) {
                    if (value!) {
                      controller.selectedMoreFilters.add(e);
                    } else {
                      controller.selectedMoreFilters.remove(e);
                    }
                  },
                  title: e,
                ),
              )
              .toList(),
        ),
      );
}
