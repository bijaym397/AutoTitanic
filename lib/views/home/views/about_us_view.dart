import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/navigators/navigators.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  static const String route = AppRoutes.aboutUs;

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.aboutUs),
        ),
      );
}
