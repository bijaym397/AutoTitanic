import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
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

  void _closeOverlay(bool isHovering) {
    if (isHovering) {
      Get.find<HomeController>().closeOverlay();
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        width: preferredSize.width,
        alignment: Alignment.center,
        color: AppColors.black,
        child: GetBuilder<HomeController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TapHandler(
                    onTap: () => Get.toNamed(HomeView.route),
                    onHover: _closeOverlay,
                    child: Image.asset(
                      AssetConstants.logo,
                      width: 0.05.pw,
                    ),
                  ),
                  TapHandler(
                    onHover: _closeOverlay,
                    showArrowCursor: true,
                    child: SizedBox(
                      height: preferredSize.height,
                      width: Dimens.fortyEight,
                    ),
                  ),
                  $HeaderItem(height: preferredSize.height),
                  TapHandler(
                    onTap: () {},
                    onHover: _closeOverlay,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}

class $HeaderItem extends StatelessWidget {
  const $HeaderItem({
    super.key,
    required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) => Row(
        children: List.generate(
          Vehicle.values.length,
          (i) => $NavItem(
            Vehicle.values[i],
            navBarContext: context,
            height: height,
          ),
        ),
      );
}

class $NavItem extends StatelessWidget {
  $NavItem(
    this.vehicle, {
    super.key,
    required this.navBarContext,
    required this.height,
  }) : layerLink = LayerLink();

  final Vehicle vehicle;
  final BuildContext navBarContext;
  final double height;
  final LayerLink layerLink;

  @override
  Widget build(BuildContext context) => GetX<HomeController>(
        builder: (controller) {
          var color = vehicle == controller.selectedVehicle
              ? AppColors.red
              : AppColors.white;
          return CompositedTransformTarget(
            link: layerLink,
            child: TapHandler(
              onHover: (event) {
                if (event) {
                  controller.selectedVehicle = vehicle;
                  controller.closeOverlay(false);
                  if (vehicle.showIcon) {
                    controller.showOverlay(
                      context: navBarContext,
                      itemContext: context,
                      layerLink: layerLink,
                      child: $NavDialog(vehicle),
                    );
                  }
                }
              },
              onTap: vehicle.showIcon ? null : () {},
              child: SizedBox(
                height: height,
                child: Padding(
                  padding: Dimens.edgeInsets8_0,
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
              ),
            ),
          );
        },
      );
}

class $NavDialog extends StatelessWidget {
  const $NavDialog(
    this.vehicle, {
    super.key,
  });

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: Colors.grey, width: 0.1).withSide(
            top: const BorderSide(
              color: AppColors.red,
              width: Dimens.six,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...HoverItem.values.indexed.map<Widget>(
              (e) => Container(
                width: Dimens.twoHundred,
                padding: Dimens.edgeInsets12,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: e.$1 == HoverItem.values.length - 1
                        ? BorderSide.none
                        : const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                  ),
                ),
                child: Text(
                  e.$2.getLabel(vehicle),
                  style: context.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
