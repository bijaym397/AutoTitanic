import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: Dimens.fiveHundred,
        width: Dimens.screenWidth,
        color: AppColors.white,
        padding: Dimens.edgeInsets16_20,
        margin: Dimens.edgeInsets0_40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitleText('BROWSE BY MAKE'),
            Dimens.boxHeight20,
            Flexible(
              child: GetBuilder<HomeController>(
                builder: (controller) => GridView.builder(
                  itemCount: controller.brandsList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: Dimens.edgeInsets10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 2.5 / 1,
                    crossAxisSpacing: Dimens.sixteen,
                    mainAxisSpacing: Dimens.sixteen,
                  ),
                  itemBuilder: (_, index) => $BrandTile(
                    controller.brandsList[index],
                  ),
                ),
              ),
            ),
            Dimens.boxHeight20,
            UnconstrainedBox(
              child: Button(
                onTap: () {},
                label: '+ Show All Makes',
                width: Dimens.twoHundred,
              ),
            ),
          ],
        ),
      );
}

class $BrandTile extends StatelessWidget {
  const $BrandTile(
    this.brand, {
    super.key,
  });

  final BrandModel brand;

  @override
  Widget build(BuildContext context) => Container(
        key: key,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(Dimens.two, Dimens.two),
              color: AppColors.grey,
              blurRadius: Dimens.eight,
              spreadRadius: Dimens.four,
            ),
          ],
          borderRadius: BorderRadius.circular(Dimens.eight),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              brand.icon,
              height: Dimens.fortyEight,
              width: Dimens.fortyEight,
            ),
            AppText(brand.name),
          ],
        ),
      );
}
