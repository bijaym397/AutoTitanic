import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = AppRoutes.home;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        showSubscribeCard: true,
        bodyBuilder: (_, isHovering) => ColoredBox(
          color: Colors.yellow,
          child: SizedBox(
            height: 0.8.ph,
            child: const Center(
              child: Text('Home View'),
            ),
          ),
        ),
      );
}
