import 'package:auto_titanic/utils/navigators/navigators.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  static const String route = AppRoutes.auth;

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: AppText('Auth View'),
        ),
      );
}
