import 'package:auto_titanic/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImage extends StatelessWidget {
  SvgImage(
    String svg, {
    super.key,
    this.color,
    this.dimensions,
  }) : path = svg.svgPath;

  final String path;
  final Color? color;
  final double? dimensions;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        path,
        height: dimensions,
        width: dimensions,
        colorFilter: color != null
            ? ColorFilter.mode(
                color!,
                BlendMode.srcIn,
              )
            : null,
      );
}
