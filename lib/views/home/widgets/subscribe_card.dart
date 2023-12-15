import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SubscribeCard extends StatelessWidget {
  const SubscribeCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: Dimens.twoHundred,
        width: double.maxFinite,
        color: Colors.grey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  AppStrings.subscribeHeading,
                  style: Styles.headlineMedium.copyWith(
                    color: AppColors.red,
                  ),
                ),
                Dimens.boxHeight4,
                AppText(
                  AppStrings.subscribeSubtitle,
                  style: Styles.bodyMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            $SubscribeEmail(),
          ],
        ),
      );
}

class $SubscribeEmail extends StatelessWidget {
  $SubscribeEmail({super.key}) : height = Dimens.fortyEight;

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        width: 0.3.pw,
        child: ColoredBox(
          color: Colors.blue,
          child: Row(
            children: [
              const Expanded(
                child: InputField(
                  hint: AppStrings.subscribeHint,
                ),
              ),
              TapHandler(
                onTap: () {},
                child: Container(
                  height: height,
                  width: 0.07.pw,
                  color: AppColors.red,
                  alignment: Alignment.center,
                  child: AppText(
                    AppStrings.subscribe,
                    style: Styles.labelLarge.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
