import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddImage extends StatelessWidget {
  const AddImage({
    super.key,
    this.onTap,
    this.dimensions,
  });

  final VoidCallback? onTap;
  final double? dimensions;

  @override
  Widget build(BuildContext context) => UnconstrainedBox(
        child: TapHandler(
          onTap: onTap,
          child: Container(
            height: dimensions ?? Dimens.eighty,
            width: dimensions ?? Dimens.eighty,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(Dimens.eight),
              color: AppColors.primary.withOpacity(0.1),
            ),
            alignment: Alignment.center,
            child: const AppIcon(
              Icons.add_rounded,
              color: AppColors.primary,
            ),
          ),
        ),
      );
}
