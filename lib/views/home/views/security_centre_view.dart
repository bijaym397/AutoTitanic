import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/material.dart';

class SecurityCentreView extends StatelessWidget {
  const SecurityCentreView({super.key});

  static const String route = AppRoutes.secuirityCentre;

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.safetyCentre),
        ),
      );
}
