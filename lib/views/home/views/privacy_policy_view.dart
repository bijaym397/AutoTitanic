import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/navigators/navigators.dart';
import 'package:flutter/material.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  static const String route = AppRoutes.privacyPolicy;

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.privacyPolicy),
        ),
      );
}
