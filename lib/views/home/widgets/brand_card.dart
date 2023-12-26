import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({super.key});

  static const String updateId = 'brand-card';

  @override
  Widget build(BuildContext context) => Container(
        // height: Dimens.fiveHundred,
        width: context.screenWidth,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Dimens.sixteen),
        ),
        padding: Dimens.edgeInsets16_20,
        margin: Dimens.edgeInsets0_40,
        child: GetBuilder<HomeController>(
          id: updateId,
          builder: (controller) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TitleText('BROWSE BY MAKE'),
              Dimens.boxHeight20,
              if (controller.brandsList.isEmpty) ...[
                const Center(
                  child: AppText('Loading Brands'),
                )
              ] else ...[
                GridView.builder(
                  itemCount: controller.brandsList.take(8).length,
                  padding: Dimens.edgeInsets10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: Dimens.twoHundredFifty,
                    // mainAxisExtent: Dimens.hundred,
                    childAspectRatio: 2.5 / 1,
                    crossAxisSpacing: Dimens.sixteen,
                    mainAxisSpacing: Dimens.sixteen,
                  ),
                  itemBuilder: (_, index) => $BrandTile(
                    controller.brandsList[index],
                  ),
                ),
              ],
              Dimens.boxHeight20,
              UnconstrainedBox(
                child: Button(
                  onTap: controller.brandsList.isEmpty
                      ? null
                      : () {
                          controller.isBrandsExpanded = !controller.isBrandsExpanded;
                          controller.update(['$updateId-expand']);
                        },
                  label: 'Show All Makes',
                  width: Dimens.twoHundred,
                ),
              ),
              GetBuilder<HomeController>(
                id: '$updateId-expand',
                builder: (_) => !controller.isBrandsExpanded
                    ? const SizedBox.shrink()
                    : GridView.builder(
                        itemCount: controller.brandsList.length,
                        padding: Dimens.edgeInsets10,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: Dimens.twoHundred,
                          // mainAxisExtent: Dimens.hundred,
                          childAspectRatio: 2.5 / 1,
                          crossAxisSpacing: Dimens.sixteen,
                          mainAxisSpacing: Dimens.eight,
                        ),
                        itemBuilder: (_, index) {
                          var brand = controller.brandsList[index];
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppImage(
                                imageUrl: brand.logo,
                                dimensions: Dimens.thirtyTwo,
                                isNetworkImage: true,
                                name: brand.label,
                              ),
                              Dimens.boxWidth10,
                              AppText(brand.label),
                            ],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      );
}

class $BrandTile extends StatelessWidget {
  const $BrandTile(
    this.brand, {
    super.key,
  });

  final MakeModel brand;

  @override
  Widget build(BuildContext context) => Container(
        key: key,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(Dimens.two, Dimens.two),
              color: AppColors.grey,
              blurRadius: Dimens.eight,
              spreadRadius: Dimens.four,
            ),
          ],
          borderRadius: BorderRadius.circular(Dimens.twelve),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImage(
              imageUrl: brand.logo,
              dimensions: Dimens.fortyEight,
              isNetworkImage: true,
              name: brand.label,
            ),
            AppText(brand.label),
          ],
        ),
      );
}
