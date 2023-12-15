import 'package:auto_titanic/res/res.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData kAppTheme = ThemeData(
  colorSchemeSeed: AppColors.primary,
  textTheme: GoogleFonts.getTextTheme('Roboto'),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(AppColors.white),
    ),
  ),
  checkboxTheme: const CheckboxThemeData(
    visualDensity: VisualDensity.compact,
  ),
);
