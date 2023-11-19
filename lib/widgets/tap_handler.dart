import 'package:flutter/material.dart';

class TapHandler extends StatelessWidget {
  const TapHandler({
    super.key,
    this.child,
    this.onTap,
    this.onHover,
    this.mouseCursor,
    this.showArrowCursor = false,
  });

  final Widget? child;
  final VoidCallback? onTap;
  final void Function(bool)? onHover;
  final MouseCursor? mouseCursor;
  final bool showArrowCursor;

  @override
  Widget build(BuildContext context) => InkWell(
        mouseCursor:
            mouseCursor ?? (showArrowCursor ? SystemMouseCursors.basic : null),
        onHover: onHover,
        onTap: onHover == null ? onTap : onTap ?? () {},
        child: child,
      );
}
