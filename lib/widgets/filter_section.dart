import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Container(
        width: Get.width,
        color: AppColors.white,
        alignment: Alignment.center,
        child: SizedBox(
          width: Dimens.screenWidth,
          child: Stack(
            children: [
              Image.asset(
                AssetConstants.homeTopBg,
                height: 0.4.ph,
                width: Dimens.screenWidth,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              Positioned(
                left: Dimens.forty,
                bottom: Dimens.twenty,
                child: $FilterCard(onTap: onTap),
              ),
            ],
          ),
        ),
      );
}

class $FilterCard extends StatelessWidget {
  const $FilterCard({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        padding: Dimens.edgeInsets16,
        child: Button(
          label: 'Search Results',
          onTap: onTap,
        ),
      );
}
