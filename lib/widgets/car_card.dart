import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) => ClipRRect(
        key: key,
        borderRadius: BorderRadius.circular(Dimens.twelve),
        child: ColoredBox(
          color: Colors.white,
          child: ObxValue<RxBool>(
            (isHovering) => TapHandler(
              onHover: (value) {
                isHovering.value = value;
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 3 / 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimens.twelve),
                      child: Stack(
                        children: [
                          Image.asset(
                            image,
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                          ),
                          if (isHovering.value)
                            DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const $CardHoverIcon(Icons.link_rounded),
                                    const $CardHoverIcon(Icons.sync_alt_rounded),
                                    $CardHoverIcon(
                                      Icons.fullscreen_rounded,
                                      onTap: () => Get.dialog(
                                        FullScreenDialog(
                                          images: [image],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Dimens.boxHeight10,
                  Expanded(
                    child: Padding(
                      padding: Dimens.edgeInsets12_8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AppText(
                            '2023 | Car Derived Van | 89',
                            style: Styles.bodyLarge,
                          ),
                          AppText(
                            'BMW 3 SERIES',
                            style: Styles.bodyMedium.copyWith(
                              color: AppColors.red,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Chip(
                            label: AppText(
                              'Private',
                              style: Styles.labelMedium,
                            ),
                            labelPadding: Dimens.edgeInsets4_2,
                            color: MaterialStateProperty.all(Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Dimens.eighty),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const Spacer(),
                  ColoredBox(
                    color: AppColors.accent,
                    child: Padding(
                      padding: Dimens.edgeInsets12,
                      child: DefaultTextStyle(
                        style: Styles.bodyMedium.copyWith(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              'R50,000,000',
                              style: Styles.bodyLarge,
                            ),
                            AppText(
                              'Nigeria',
                              style: Styles.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            false.obs,
          ),
        ),
      );
}

class LabelBox extends StatelessWidget {
  const LabelBox({
    super.key,
    required this.child,
    required this.color,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: Dimens.edgeInsets8_4,
        margin: Dimens.edgeInsets8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimens.four),
        ),
        child: child,
      );
}

class $CardHoverIcon extends StatelessWidget {
  const $CardHoverIcon(
    this.icon, {
    super.key,
    this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets4,
        child: ObxValue<RxBool>(
          (isHovering) => TapHandler(
            onHover: (value) {
              isHovering.value = value;
            },
            onTap: onTap,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isHovering.value ? AppColors.white : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white),
              ),
              child: Padding(
                padding: Dimens.edgeInsets4,
                child: AppIcon(
                  icon,
                  color: isHovering.value ? AppColors.red : AppColors.white,
                ),
              ),
            ),
          ),
          false.obs,
        ),
      );
}
