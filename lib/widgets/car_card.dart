import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) => Container(
        key: key,
        color: Colors.white,
        height: Dimens.fourHundred,
        width: Dimens.threeHundred,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                  height: Dimens.twoHundred,
                  width: Dimens.threeHundred,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Dimens.boxHeight10,
            Padding(
              padding: Dimens.edgeInsets12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    '2023 | Car Derived Van | Manual | 89',
                  ),
                  Dimens.boxHeight4,
                  AppText(
                    'BMW 3 SERIES',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Dimens.boxHeight4,
                  Chip(
                    label: const AppText('Private'),
                    color: MaterialStateProperty.all(Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.eighty),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const ColoredBox(
              color: Colors.blue,
              child: Padding(
                padding: Dimens.edgeInsets8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('R50,000,000'),
                    AppText('Nigeria'),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

class LabelBox extends StatelessWidget {
  const LabelBox({
    super.key,
    required this.child,
    required this.color,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: Dimens.edgeInsets8_4,
        margin: Dimens.edgeInsets8,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimens.four),
        ),
        child: child,
      );
}
