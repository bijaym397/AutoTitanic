import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardFooter extends StatelessWidget {
  const DashboardFooter({
    super.key,
    // this.showSubcribeCard = false,
  });

  // final bool showSubcribeCard;

  @override
  Widget build(BuildContext context) => Container(
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
                  GridView.builder(
                    padding: Dimens.edgeInsets16_0,
                    itemCount: Social.values.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: Dimens.threeFifty,
                      mainAxisExtent: Dimens.sixtyFour,
                    ),
                    itemBuilder: (_, index) => SocialCard(Social.values[index]),
                  ),
                  Divider(
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
              child: AppText(
                AppStrings.copyright,
                style: Styles.labelLarge.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      );
}
