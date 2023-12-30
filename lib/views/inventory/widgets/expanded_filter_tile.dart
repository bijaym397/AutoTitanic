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
          FilterType.expandable => DropDownExpandedFilter(
              filter: filter,
              minItems: filter.minList,
              maxItems: filter.maxList,
              labelBuilder: (value) => '$value',
              onMinChanged: (_) {},
              onMaxChanged: (_) {},
            ),
          FilterType.popup => const SizedBox.shrink(),
        },
      );
}
