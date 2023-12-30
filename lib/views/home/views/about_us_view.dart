import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  static const String route = AppRoutes.aboutUs;

  @override
  Widget build(BuildContext context) => const StaticPage(
        title: AppStrings.aboutUs,
        content: StringData.aboutUs,
      );
}
