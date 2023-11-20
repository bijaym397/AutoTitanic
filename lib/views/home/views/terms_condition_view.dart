import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/navigators/navigators.dart';
import 'package:flutter/material.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});

  static const String route = AppRoutes.termsCondition;

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.termsConditions),
        ),
      );
}
