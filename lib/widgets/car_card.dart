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
        borderRadius: BorderRadius.circular(Dimens.twelve),
        child: ColoredBox(
          key: key,
          color: Colors.white,
          child: AspectRatio(
            aspectRatio: 2 / 3,
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
                        const Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              $CardHoverIcon(Icons.link_rounded),
                              $CardHoverIcon(Icons.sync_alt_rounded),
                              $CardHoverIcon(Icons.fullscreen_rounded),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Dimens.boxHeight10,
                Padding(
                  padding: Dimens.edgeInsets12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        '2023 | Car Derived Van | Manual | 89',
                      ),
                      Dimens.boxHeight4,
                      AppText(
                        'BMW 3 SERIES',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Dimens.boxHeight4,
                      Chip(
                        label: const AppText('Private'),
                        color: MaterialStateProperty.all(Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimens.eighty),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ColoredBox(
                  color: Colors.indigo,
                  child: Padding(
                    padding: Dimens.edgeInsets12,
                    child: DefaultTextStyle(
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText('R50,000,000'),
                          AppText('Nigeria'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets4,
        child: ObxValue<RxBool>(
          (isHovering) => TapHandler(
            onHover: (value) {
              isHovering.value = value;
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isHovering.value ? AppColors.white : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white),
              ),
              child: Padding(
                padding: Dimens.edgeInsets4,
                child: Icon(
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
