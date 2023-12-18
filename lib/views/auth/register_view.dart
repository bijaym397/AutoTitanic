import 'package:auto_titanic/utils/navigators/navigators.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const String route = AppRoutes.login;

  @override
  Widget build(BuildContext context) => const ScreenWrapper(
        body: Center(
          child: AppText('Register'),
        ),
      );
}
