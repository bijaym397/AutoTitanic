import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
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
  });

  final List<T> items;
  final String hint;
  final void Function(T?)? onChanged;
  final WidgetCallback<T> labelBuilder;
  final T? value;

  @override
  Widget build(BuildContext context) => DropdownButton2<T>(
        buttonStyleData: ButtonStyleData(
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
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.arrow_drop_down_rounded),
          openMenuIcon: Icon(Icons.arrow_drop_up_rounded),
        ),
        isExpanded: true,
        hint: Text(hint),
        underline: const SizedBox.shrink(),
        value: value,
        items: items
            .map(
              (e) => DropdownMenuItem<T>(
                value: e,
                child: labelBuilder(e),
              ),
            )
            .toList(),
        onChanged: onChanged,
      );
}
