import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onTap,
    required this.label,
    this.icon,
    this.height,
    this.width,
    this.hoverColor,
    this.color,
    this.textColor,
    this.hoverTextColor,
    this.makeResponsive = false,
  }) : _withIcon = false;

  const Button.icon({
    super.key,
    this.onTap,
    required this.label,
    this.color,
    required this.icon,
  })  : assert(icon != null),
        _withIcon = true,
        height = null,
        width = null,
        hoverColor = null,
        textColor = null,
        hoverTextColor = null,
        makeResponsive = false;

  final VoidCallback? onTap;
  final String label;
  final bool _withIcon;
  final IconData? icon;
  final double? height;
  final double? width;
  final Color? hoverColor;
  final Color? color;
  final Color? textColor;
  final Color? hoverTextColor;
  final bool makeResponsive;

  Color _textColor(bool isHovering) =>
      onTap == null ? Colors.grey : (isHovering ? (hoverTextColor ?? AppColors.white) : (textColor ?? AppColors.white));

  @override
  Widget build(BuildContext context) {
    if (_withIcon) {
      return _IconButton(
        onTap: onTap,
        icon: icon!,
        label: label,
      );
    }
    return ObxValue<RxBool>(
      (isHovering) => TapHandler(
        onTap: onTap,
        onHover: (value) {
          isHovering.value = value;
        },
        child: AnimatedContainer(
          height: makeResponsive ? null : (height ?? context.fieldHeight),
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
          padding: context.isMobileView ? Dimens.edgeInsets6 : Dimens.edgeInsets8,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                AppIcon(
                  icon!,
                  color: _textColor(isHovering.value),
                ),
                Dimens.boxWidth10,
              ],
              AppText(
                label,
                isSelectable: false,
                style: Styles.labelLarge.copyWith(
                  color: _textColor(isHovering.value),
                  overflow: TextOverflow.visible,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      false.obs,
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    this.onTap,
    required this.icon,
    required this.label,
  });

  final VoidCallback? onTap;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    if (context.isMobileView) {
      return IconButton(
        onPressed: onTap,
        icon: AppIcon(icon),
      );
    }
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: AppIcon(icon),
      label: AppText(label),
    );
  }
}
