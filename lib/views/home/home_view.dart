import 'package:auto_titanic/utils/navigators/navigators.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = AppRoutes.home;

  @override
  Widget build(BuildContext context) => const ScreenWrapper(
        showSubscribeCard: true,
        body: ColoredBox(
          color: Colors.yellow,
          child: Center(
            child: Text('Home View'),
          ),
        ),
      );
}
