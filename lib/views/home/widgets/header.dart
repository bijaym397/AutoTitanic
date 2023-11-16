import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/tap_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardHeader extends StatelessWidget implements PreferredSizeWidget {
  const DashboardHeader({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Size get preferredSize => Size(Get.width, height ?? Dimens.appbarHeight);

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        width: preferredSize.width,
        alignment: Alignment.center,
        color: AppColors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetConstants.logo,
                  width: 0.05.pw,
                ),
                Dimens.boxWidth48,
                ...List.generate(
                  Vehicle.values.length,
                  (i) => _NavItem(Vehicle.values[i]),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class _NavItem extends StatelessWidget {
  const _NavItem(this.vehicle);

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) => GetX<HomeController>(
        builder: (controller) {
          var color = vehicle == controller.selectedVehicle
              ? AppColors.red
              : AppColors.white;
          return TapHandler(
            onHover: (event) {
              if (event) {
                controller.selectedVehicle = vehicle;
              } else {
                controller.selectedVehicle = null;
              }
            },
            onTap: () {},
            child: Padding(
              padding: Dimens.edgeInsets8_32,
              child: Row(
                children: [
                  Text(
                    vehicle.label,
                    style: context.textTheme.labelMedium!.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (vehicle.showIcon) ...[
                    Dimens.boxWidth4,
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: color,
                      size: Dimens.twenty,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      );
}
