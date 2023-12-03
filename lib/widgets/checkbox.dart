import 'package:auto_titanic/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCheckBoxListTile extends StatelessWidget {
  const AppCheckBoxListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
  });

  final bool value;
  final void Function(bool?) onChanged;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(
          checkboxTheme: CheckboxThemeData(
            checkColor: MaterialStateProperty.all(AppColors.white),
            fillColor: MaterialStateProperty.resolveWith(
              (states) => states.any((e) => [MaterialState.selected, MaterialState.pressed].contains(e)) ? AppColors.primary : null,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.four),
            ),
          ),
          unselectedWidgetColor: AppColors.primary,
        ),
        child: CheckboxListTile(
          contentPadding: Dimens.edgeInsets0,
          visualDensity: VisualDensity.compact,
          dense: true,
          enableFeedback: true,
          onChanged: onChanged,
          value: value,
          title: Text(
            title,
            style: context.textTheme.labelMedium,
          ),
          subtitle: subtitle == null ? null : Text(subtitle!),
          controlAffinity: ListTileControlAffinity.leading,
        ),
      );
}
