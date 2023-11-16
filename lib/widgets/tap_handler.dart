import 'package:flutter/material.dart';

class TapHandler extends StatelessWidget {
  const TapHandler({
    super.key,
    this.child,
    this.onTap,
    this.onHover,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final void Function(bool)? onHover;

  @override
  Widget build(BuildContext context) => InkWell(
        onHover: onHover,
        onTap: onTap,
        child: child,
      );
}
