import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/views/home/widgets/widgets.dart';
import 'package:auto_titanic/widgets/tap_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const DashboardHeader(),
        body: GetBuilder<HomeController>(
          builder: (controller) => TapHandler(
            showArrowCursor: true,
            onHover: (isHovering) {
              if (isHovering) {
                controller.closeOverlay();
              }
            },
            child: const ColoredBox(
              color: Colors.yellow,
              child: Center(
                child: Text('Home View'),
              ),
            ),
          ),
        ),
      );
}
