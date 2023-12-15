import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDown<T> extends StatelessWidget {
  const DropDown({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    required this.labelBuilder,
    required this.hint,
    this.isRequired = false,
    this.showTitle = false,
    this.maxHeight,
  });

  final List<T> items;
  final String hint;
  final void Function(T?)? onChanged;
  final StringCallback<T> labelBuilder;
  final T? value;
  final bool showTitle;
  final bool isRequired;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showTitle)
            Padding(
              padding: Dimens.edgeInsets4,
              child: Row(
                children: [
                  if (isRequired)
                    AppText(
                      '*',
                      style: Styles.titleLarge.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  AppText(
                    hint,
                    style: Styles.titleMedium,
                  ),
                ],
              ),
            ),
          DropdownButton2<T>(
            buttonStyleData: ButtonStyleData(
              height: Dimens.forty,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(Dimens.eight),
              ),
              padding: Dimens.edgeInsetsR8,
            ),
            dropdownStyleData: DropdownStyleData(
              offset: Offset(0, -Dimens.eight),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.eight),
              ),
              padding: Dimens.edgeInsets6,
              maxHeight: maxHeight,
              // scrollPadding: EdgeInsets.zero,
            ),
            iconStyleData: const IconStyleData(
              icon: AppIcon(Icons.keyboard_arrow_down_rounded),
              // icon: AppIcon(Icons.arrow_drop_down_rounded),
              openMenuIcon: AppIcon(Icons.keyboard_arrow_up_rounded),
              // openMenuIcon: AppIcon(Icons.arrow_drop_up_rounded),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: Dimens.twentyEight,
              selectedMenuItemBuilder: (_, child) => ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.four),
                child: ColoredBox(
                  color: AppColors.primary.withOpacity(0.1),
                  child: child,
                ),
              ),
            ),
            isExpanded: true,
            isDense: true,
            hint: AppText(
              (showTitle ? 'Select ' : '') + hint,
              style: Styles.bodyLarge,
            ),
            underline: const SizedBox.shrink(),
            value: value,
            items: items
                .map(
                  (e) => DropdownMenuItem<T>(
                    value: e,
                    child: AppText(
                      labelBuilder(e),
                      style: Styles.labelLarge,
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
          ),
        ],
      );
}
