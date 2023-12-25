import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardHeader extends StatelessWidget implements PreferredSizeWidget {
  const DashboardHeader({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Size get preferredSize => Size(Get.width, _navHeight);

  double get _navHeight => height ?? Dimens.appbarHeight;

  void _closeOverlay(bool isHovering) {
    if (isHovering) {
      Get.find<CommonController>().closeOverlay();
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        width: preferredSize.width,
        alignment: Alignment.center,
        color: AppColors.white,
        child: GetBuilder<CommonController>(
          builder: (controller) => SizedBox(
            width: Dimens.screenWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TapHandler(
                  onTap: () => Get.toNamed(HomeView.route),
                  onHover: _closeOverlay,
                  child: Image.asset(
                    AssetConstants.logo,
                    height: Dimens.thirtyTwo,
                  ),
                ),
                // Expanded(
                //   child: TapHandler(
                //     onHover: _closeOverlay,
                //     showArrowCursor: true,
                //     child: SizedBox(
                //       height: _navHeight,
                //       width: Dimens.fortyEight,
                //     ),
                //   ),
                // ),

                $HeaderItem(
                  height: _navHeight,
                ),
                $SignInButton(
                  onHover: _closeOverlay,
                ),
                if (context.isDesktopView)
                  TapHandler(
                    onTap: () {},
                    onHover: _closeOverlay,
                    child: IconButton(
                      onPressed: () {},
                      icon: const AppIcon(
                        Icons.search_rounded,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                if (Dimens.screenWidth < AppConstants.maxMobileWidth) ...[
                  TapHandler(
                    onTap: () {},
                    child: const AppIcon(
                      Icons.menu,
                    ),
                  ),
                ],
              ],
            ),
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
  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: context.isMobileView
            ? const SizedBox.shrink()
            : Align(
                alignment: Alignment.centerRight,
                child: ListView.builder(
                  itemCount: Vehicle.values.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, i) => $NavItem(
                    Vehicle.values[i],
                    navBarContext: context,
                    height: height,
                  ),
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
  Widget build(BuildContext context) => GetX<CommonController>(
        builder: (controller) {
          var color = vehicle == controller.selectedVehicle || vehicle == controller.hoveredVehicle ? AppColors.red : AppColors.black;
          return CompositedTransformTarget(
            link: layerLink,
            child: TapHandler(
              onHover: (event) {
                if (event) {
                  controller.hoveredVehicle = vehicle;
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
              onTap: vehicle.showIcon
                  ? () {
                      if (vehicle == Vehicle.cars) {
                        controller.goToVehicleListing(vehicle, HoverItem.used);
                      }
                    }
                  : () {},
              child: SizedBox(
                height: height,
                child: Padding(
                  padding: context.isTabletView ? Dimens.edgeInsets2_0 : Dimens.edgeInsets4_0,
                  child: Row(
                    children: [
                      AppText(
                        vehicle.label,
                        isSelectable: false,
                        style: Styles.labelSmall.copyWith(
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (vehicle.showIcon) ...[
                        AppIcon(
                          Icons.keyboard_arrow_down_rounded,
                          color: color,
                          size: Dimens.sixteen,
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
            top: BorderSide(
              color: AppColors.red,
              width: Dimens.six,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...HoverItem.values.indexed.map<Widget>(
              (e) => GetX<CommonController>(builder: (controller) {
                var item = e.$2;
                var color = (item == controller.selectedItem && controller.selectedVehicle == vehicle) || item == controller.hoveredItem
                    ? AppColors.red
                    : AppColors.black;

                return TapHandler(
                  onHover: (value) {
                    if (value) {
                      controller.hoveredItem = item;
                    } else {
                      controller.hoveredItem = null;
                    }
                  },
                  onTap: () {
                    if (vehicle == Vehicle.cars) {
                      controller.goToVehicleListing(vehicle, item);
                    }
                  },
                  child: Container(
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
                    child: AppText(
                      item.getLabel(vehicle),
                      isSelectable: false,
                      style: Styles.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      );
}

class $SignInButton extends StatelessWidget {
  const $SignInButton({
    super.key,
    this.onHover,
  });

  final void Function(bool)? onHover;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets10_0,
        child: TapHandler(
          onTap: RouteManagement.goToLogin,
          onHover: onHover,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppIcon(
                Icons.account_circle_outlined,
              ),
              AppText(
                'Sign In',
                isSelectable: false,
                style: Styles.labelMedium,
              ),
            ],
          ),
        ),
      );
}
