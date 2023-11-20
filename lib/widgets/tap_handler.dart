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
        hoverColor: showArrowCursor ? Colors.transparent : null,
        focusColor: showArrowCursor ? Colors.transparent : null,
        splashColor: showArrowCursor ? Colors.transparent : null,
        highlightColor: showArrowCursor ? Colors.transparent : null,
        overlayColor: showArrowCursor
            ? MaterialStateProperty.all(Colors.transparent)
            : null,
        mouseCursor:
            mouseCursor ?? (showArrowCursor ? SystemMouseCursors.basic : null),
        onHover: onHover,
        onTap: onHover == null ? onTap : onTap ?? () {},
        child: child,
      );
}
