import 'package:auto_titanic/res/res.dart';
import 'package:flutter/material.dart';

class FieldSuffixLoader extends StatelessWidget {
  const FieldSuffixLoader({
    super.key,
    required this.showIcon,
    required this.isError,
    required this.isLoading,
  });

  final bool showIcon;
  final bool isError;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (!showIcon) {
      return const SizedBox.shrink();
    }
    if (isLoading) {
      return SizedBox.square(
        dimension: Dimens.twentyFour,
        child: Padding(
          padding: Dimens.edgeInsets12,
          child: const CircularProgressIndicator(
            color: AppColors.primary,
            strokeWidth: 2,
          ),
        ),
      );
    }
    if (isError) {
      return const Icon(
        Icons.cancel_rounded,
        color: AppColors.red,
      );
    }
    return const Icon(
      Icons.check_circle_rounded,
      color: AppColors.green,
    );
  }
}
