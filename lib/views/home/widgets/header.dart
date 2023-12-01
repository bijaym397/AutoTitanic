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
      Get.find<HomeController>().closeOverlay();
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        width: preferredSize.width,
        alignment: Alignment.center,
        color: AppColors.white,
        child: GetBuilder<HomeController>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              LayoutBuilder(
                builder: (_, constraint) => SizedBox(
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
                      Expanded(
                        child: TapHandler(
                          onHover: _closeOverlay,
                          showArrowCursor: true,
                          child: SizedBox(
                            height: _navHeight,
                            width: Dimens.fortyEight,
                          ),
                        ),
                      ),
                      $HeaderItem(
                        height: _navHeight,
                        constraints: constraint,
                      ),
                      $SignInButton(
                        onHover: _closeOverlay,
                      ),
                      if (Dimens.screenWidth >= AppConstants.maxDesktopWidth)
                        TapHandler(
                          onTap: () {},
                          onHover: _closeOverlay,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search_rounded,
                            ),
                          ),
                        ),
                      if (Dimens.screenWidth < AppConstants.maxTabletWidth) ...[
                        TapHandler(
                          onTap: () {},
                          child: const Icon(
                            Icons.menu,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
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
    required this.constraints,
  });

  final double height;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          Vehicle.visibleVehicles.length,
          (i) => $NavItem(
            Vehicle.visibleVehicles[i],
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
          var color = vehicle == controller.selectedVehicle ? AppColors.red : AppColors.black;
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
                  padding: Dimens.edgeInsets4_0,
                  child: Row(
                    children: [
                      AppText(
                        vehicle.label,
                        isSelectable: false,
                        style: context.textTheme.labelSmall!.copyWith(
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (vehicle.showIcon) ...[
                        Icon(
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
                child: AppText(
                  e.$2.getLabel(vehicle),
                  isSelectable: false,
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
          onTap: () {},
          onHover: onHover,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.account_circle_outlined,
              ),
              AppText(
                'Sign In',
                isSelectable: false,
                style: context.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      );
}
