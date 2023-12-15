import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onTap,
    required this.label,
    this.height,
    this.width,
    this.hoverColor,
    this.color,
    this.textColor,
    this.hoverTextColor,
    this.makeResponsive = false,
  });

  final VoidCallback? onTap;
  final String label;
  final double? height;
  final double? width;
  final Color? hoverColor;
  final Color? color;
  final Color? textColor;
  final Color? hoverTextColor;
  final bool makeResponsive;

  @override
  Widget build(BuildContext context) => ObxValue<RxBool>(
        (isHovering) => TapHandler(
          onTap: onTap,
          onHover: (value) {
            isHovering.value = value;
          },
          child: AnimatedContainer(
            height: makeResponsive ? null : (height ?? Dimens.forty),
            width: width,
            decoration: BoxDecoration(
              color: isHovering.value
                  ? onTap == null
                      ? AppColors.grey
                      : hoverColor ?? AppColors.black
                  : onTap == null
                      ? AppColors.grey
                      : color ?? AppColors.primary,
              borderRadius: BorderRadius.circular(Dimens.eight),
            ),
            duration: AppConstants.animationDuration,
            padding: Dimens.edgeInsets8,
            alignment: Alignment.center,
            child: AppText(
              label,
              isSelectable: false,
              style: Styles.labelLarge.copyWith(
                color: onTap == null ? Colors.grey : (isHovering.value ? (hoverTextColor ?? AppColors.white) : (textColor ?? AppColors.white)),
                overflow: TextOverflow.visible,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        false.obs,
      );
}
