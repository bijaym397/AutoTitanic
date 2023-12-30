import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellVehicleView extends StatelessWidget {
  const SellVehicleView({super.key});

  static const String route = AppRoutes.sell;

  static const String updateId = 'sell-vehicle-id';

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        id: updateId,
        initState: (_) {
          Get.find<HomeController>().checkRoute();
        },
        builder: (controller) => ScreenWrapper(
          title: 'Sell - ${(controller.selectedVehicleCategory ?? Vehicle.cars).label}',
          isWhiteBackground: !controller.showLocationPage,
          body: AnimatedSwitcher(
            duration: AppConstants.animationDuration,
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: controller.showLocationPage ? const SellVehicleLocationView() : const SellVehicleDetailsView(),
          ),
        ),
      );
}
