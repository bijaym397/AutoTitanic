import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SecurityCentreView extends StatelessWidget {
  const SecurityCentreView({super.key});

  static const String route = AppRoutes.securityCentre;

  @override
  Widget build(BuildContext context) => const StaticPage(
        title: AppStrings.safetyCentre,
        content: StringData.safetyCentre,
      );
}
