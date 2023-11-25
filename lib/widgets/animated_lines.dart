import 'package:auto_titanic/res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedLines extends StatelessWidget {
  const AnimatedLines({
    super.key,
    required this.isHovering,
    this.width = Dimens.fortyEight,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final bool isHovering;
  final double width;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width * 2,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            AnimatedContainer(
              duration: AppConstants.animationDuration,
              height: 2,
              width: width * (isHovering ? 2 : 1),
              color: AppColors.red,
            ),
            Dimens.boxHeight4,
            AnimatedContainer(
              duration: AppConstants.animationDuration,
              height: 2,
              width: width * (isHovering ? 1 : 2),
              color: AppColors.red,
            ),
          ],
        ),
      );
}
