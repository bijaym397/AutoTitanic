import 'package:auto_titanic/res/res.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
  });

  final IconData icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) => Icon(
        icon,
        size: size ?? Dimens.twentyFour,
        color: color,
      );
}
