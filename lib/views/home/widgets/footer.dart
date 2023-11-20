import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardFooter extends StatelessWidget {
  const DashboardFooter({
    super.key,
    this.showSubcribeCard = false,
  });

  final bool showSubcribeCard;

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (controller) => Container(
          width: Get.width,
          color: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 0.7.pw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showSubcribeCard) ...[
                      const SubscribeCard(),
                      Dimens.boxHeight2,
                    ],
                    Padding(
                      padding: Dimens.edgeInsets16_0,
                      child: Row(
                        children:
                            Social.values.map<Widget>(SocialCard.new).toList(),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: Dimens.sixteen,
                      endIndent: Dimens.sixteen,
                    ),
                    const FooterLinks(),
                    const ReadMore(),
                  ],
                ),
              ),
              Container(
                height: Dimens.eighty,
                width: Get.width,
                color: AppColors.black,
                alignment: Alignment.center,
                child: Text(
                  AppStrings.copyright,
                  style: context.textTheme.labelLarge!.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class ReadMore extends StatelessWidget {
  const ReadMore({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets40,
        child: SizedBox(
          width: 0.3.pw,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.lookingForCar.toUpperCase(),
                      style: context.textTheme.titleMedium,
                    ),
                    Container(
                      height: 2,
                      margin: Dimens.edgeInsets0_16,
                      width: Dimens.fortyEight,
                      color: AppColors.red,
                    ),
                    Text(
                      AppStrings.searchInventory,
                      style: context.textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Dimens.boxWidth16,
              TapHandler(
                onTap: () {},
                child: Container(
                  height: Dimens.fortyEight,
                  width: 0.07.pw,
                  color: AppColors.red,
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.readMore,
                    style: context.textTheme.labelLarge!.copyWith(
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
