import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String route = AppRoutes.login;

  @override
  Widget build(BuildContext context) => GetBuilder<AuthController>(
        builder: (controller) => ScreenWrapper(
          body: SizedBox(
            height: 0.7.ph,
            child: const Center(
              child: AppText('Login'),
            ),
          ),
        ),
      );
}
