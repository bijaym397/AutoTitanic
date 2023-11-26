import 'package:auto_titanic/res/res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    this.moreSpace = false,
  });

  final bool moreSpace;

  @override
  Widget build(BuildContext context) => Container(
        margin: Dimens.edgeInsets10.copyWith(
          left: moreSpace ? Dimens.forty : null,
          right: moreSpace ? Dimens.forty : null,
        ),
        color: Colors.white,
        height: Dimens.fourHundred,
        width: Dimens.threeHundred,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(AssetConstants.car),
                const Align(
                  alignment: Alignment.topLeft,
                  child: LabelBox(
                    color: Colors.blue,
                    child: Text('NEW'),
                  ),
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: LabelBox(
                    color: Colors.green,
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Dimens.boxHeight10,
            Padding(
              padding: Dimens.edgeInsets12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '2023 | Car Derived Van | Manual | 89',
                  ),
                  Dimens.boxHeight4,
                  Text(
                    'BMW 3 SERIES',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Dimens.boxHeight4,
                  Chip(
                    label: const Text('Private'),
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
                    Text('R50,000,000'),
                    Text('Nigeria'),
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
