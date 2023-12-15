import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.icon,
    this.child,
    this.onTap,
  }) : assert(icon != null || child != null);

  final IconData? icon;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => IconButton.outlined(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.eight),
          ),
          highlightColor: AppColors.primary.withOpacity(0.1),
          visualDensity: VisualDensity.compact,
        ),
        onPressed: onTap,
        icon: child ??
            AppIcon(
              icon!,
              color: AppColors.black,
            ),
      );
}
