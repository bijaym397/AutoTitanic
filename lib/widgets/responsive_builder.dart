import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.desktop,
    this.mobile,
    this.tablet,
  });

  final ConstrainedBuilder desktop;
  final ConstrainedBuilder? mobile;
  final ConstrainedBuilder? tablet;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        key: key,
        builder: (ctx, constraints) {
          if (constraints.maxWidth <= AppConstants.maxMobileWidth) {
            return (mobile ?? desktop).call(ctx, constraints);
          }
          if (constraints.maxWidth <= AppConstants.maxTabletWidth) {
            return (tablet ?? mobile ?? desktop).call(ctx, constraints);
          }
          return desktop(ctx, constraints);
        },
      );
}
