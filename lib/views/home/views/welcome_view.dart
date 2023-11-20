import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/navigators/navigators.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  static const String route = AppRoutes.welcome;

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.welcome),
        ),
      );
}
