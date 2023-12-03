import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDown<T> extends StatelessWidget {
  const DropDown({
    super.key,
    required this.items,
    this.onChanged,
    this.value,
    required this.labelBuilder,
    required this.hint,
  });

  final List<T> items;
  final String hint;
  final void Function(T?)? onChanged;
  final StringCallback<T> labelBuilder;
  final T? value;

  @override
  Widget build(BuildContext context) => DropdownButton2<T>(
        buttonStyleData: ButtonStyleData(
          height: Dimens.forty,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(Dimens.eight),
          ),
          padding: Dimens.edgeInsets8_4,
        ),
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, -Dimens.eight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.eight),
          ),
          padding: Dimens.edgeInsets6,
          // scrollPadding: EdgeInsets.zero,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          // icon: Icon(Icons.arrow_drop_down_rounded),
          openMenuIcon: Icon(Icons.keyboard_arrow_up_rounded),
          // openMenuIcon: Icon(Icons.arrow_drop_up_rounded),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: Dimens.twentyEight,
        ),
        isExpanded: true,
        isDense: true,
        hint: Text(hint),
        underline: const SizedBox.shrink(),
        value: value,
        items: items
            .map(
              (e) => DropdownMenuItem<T>(
                value: e,
                child: Text(
                  labelBuilder(e),
                  style: context.textTheme.labelLarge,
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      );
}
