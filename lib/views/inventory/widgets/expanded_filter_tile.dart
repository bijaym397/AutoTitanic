import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:flutter/material.dart';

class ExpandedFilterTile<T> extends StatelessWidget {
  const ExpandedFilterTile({
    super.key,
    required this.filter,
  });

  final VehicleFilter filter;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets8,
        child: switch (filter.filterType) {
          FilterType.expandable || FilterType.expandableWithOptions => DropDownExpandedFilter(
              filter: filter,
              minItems: filter.minList,
              maxItems: filter.maxList,
              labelBuilder: (value) => '$value',
              onMinChanged: (_) {},
              onMaxChanged: (_) {},
              hasSwitch: filter.filterType == FilterType.expandableWithOptions,
            ),
          FilterType.popup => const SizedBox.shrink(),
          FilterType.input => const InputExpandedFilters(),
          FilterType.checkbox => CheckboxExpandedFilter(filter: filter),
        },
      );
}
