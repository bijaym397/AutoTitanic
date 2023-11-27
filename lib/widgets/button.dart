import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onTap,
    required this.label,
    this.height,
    this.width,
  });

  final VoidCallback onTap;
  final String label;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) => ObxValue<RxBool>(
        (isHovering) => TapHandler(
          onTap: onTap,
          onHover: (value) {
            isHovering.value = value;
          },
          child: AnimatedContainer(
            height: height ?? Dimens.forty,
            width: width,
            decoration: BoxDecoration(
              color: isHovering.value ? AppColors.black : AppColors.red,
              borderRadius: BorderRadius.circular(Dimens.eight),
            ),
            duration: AppConstants.animationDuration,
            padding: Dimens.edgeInsets8,
            alignment: Alignment.center,
            child: AppText(
              label,
              isSelectable: false,
              style: context.textTheme.labelLarge!.copyWith(
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        false.obs,
      );
}
