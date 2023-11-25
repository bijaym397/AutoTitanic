import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
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
                width: Dimens.screenWidth,
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
