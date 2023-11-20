import 'package:auto_titanic/utils/navigators/navigators.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String route = AppRoutes.splash;

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Column(
          children: [
            FlutterLogo(),
            SizedBox(height: 30),
            Text('Flutter'),
          ],
        ),
      );
}
