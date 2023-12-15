import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownExpandedFilter<T> extends StatelessWidget {
  const DropDownExpandedFilter({
    super.key,
    required this.filter,
    required this.minItems,
    required this.maxItems,
    required this.labelBuilder,
    this.onMinChanged,
    this.onMaxChanged,
    this.hasSwitch = false,
  });

  final VehicleFilter filter;
  final List<T> minItems;
  final List<T> maxItems;
  final StringCallback<T> labelBuilder;
  final void Function(T?)? onMinChanged;
  final void Function(T?)? onMaxChanged;
  final bool hasSwitch;

  @override
  Widget build(BuildContext context) => GetBuilder<InventoryController>(
        id: 'dropdown-filter',
        builder: (controller) => Column(
          children: [
            if (filter.filterType == FilterType.expandableWithOptions) ...[
              FilterToggleButtons(
                labels: filter.toggleLabels,
                isSelected: controller.yearToggleList,
                onTap: (index) {
                  controller.yearToggleList[1 - index] = false;
                  controller.yearToggleList[index] = true;
                  controller.update(['dropdown-filter']);
                },
              ),
              Dimens.boxHeight16,
            ],
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    filter.first,
                    style: Styles.labelLarge,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: DropDown(
                    items: minItems,
                    labelBuilder: labelBuilder,
                    hint: 'Any',
                    onChanged: onMinChanged,
                  ),
                ),
              ],
            ),
            Dimens.boxHeight12,
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    filter.last,
                    style: Styles.labelLarge,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: DropDown(
                    items: maxItems,
                    labelBuilder: labelBuilder,
                    hint: 'Any',
                    onChanged: onMaxChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class FilterToggleButtons extends StatelessWidget {
  const FilterToggleButtons({
    super.key,
    required this.labels,
    required this.isSelected,
    required this.onTap,
  });

  final List<String> labels;
  final List<bool> isSelected;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) => ToggleButtons(
        isSelected: isSelected,
        onPressed: onTap,
        selectedColor: AppColors.primary,
        selectedBorderColor: AppColors.primary,
        fillColor: Colors.transparent,
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(Dimens.four),
        hoverColor: Colors.transparent,
        children: labels
            .map(
              (e) => Padding(
                padding: Dimens.edgeInsets8_4,
                child: Text(
                  e,
                  style: Styles.bodyMedium,
                ),
              ),
            )
            .toList(),
      );
}
