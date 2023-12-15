import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PageHeadLabel extends StatelessWidget {
  const PageHeadLabel(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) => UnconstrainedBox(
        child: Container(
          margin: Dimens.edgeInsets0_16,
          padding: Dimens.edgeInsets12_8,
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(Dimens.twelve),
          ),
          alignment: Alignment.center,
          child: AppText(
            label,
            style: Styles.bodyLarge.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      );
}

class TitleText extends StatelessWidget {
  const TitleText(
    this.label, {
    super.key,
    this.color,
  });

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) => AppText(
        label,
        style: Styles.titleLarge.copyWith(
          fontWeight: FontWeight.w700,
          color: color,
        ),
        isSelectable: true,
      );
}
