import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/material.dart';

class DropDown<T> extends StatelessWidget {
  const DropDown({
    super.key,
    required this.items,
    this.onChanged,
    required this.labelBuilder,
    required this.hint,
  });

  final List<T> items;
  final String hint;
  final void Function(T?)? onChanged;
  final WidgetCallback<T> labelBuilder;

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<T>(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.grey,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(Dimens.eight),
          ),
          hintText: hint,
          isDense: true,
        ),
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
