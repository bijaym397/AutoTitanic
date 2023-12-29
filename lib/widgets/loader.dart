import 'package:auto_titanic/res/res.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.isDialog = true,
  });

  final bool isDialog;

  @override
  Widget build(BuildContext context) => Center(
        child: Card(
          elevation: isDialog ? null : 0,
          color: isDialog ? null : Colors.transparent,
          child: Padding(
            padding: Dimens.edgeInsets8,
            child: const CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ),
        ),
      );
}
