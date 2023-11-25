import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryView extends StatelessWidget {
  InventoryView({super.key})
      : vehicle = Get.arguments as Vehicle? ?? Vehicle.cars;

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        showSubscribeCard: true,
        bodyBuilder: (_, isHovering) => GetBuilder<InventoryController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetConstants.homeTopBg,
                height: 0.4.ph,
                width: Dimens.screenWidth,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ),
      );
}
