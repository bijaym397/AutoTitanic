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
  Widget build(BuildContext context) => SizedBox(
        width: 0.25.pw,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.twelve),
          ),
          child: Padding(
            padding: Dimens.edgeInsets16,
            child: Column(
              children: [
                AppText(
                  AppStrings.findYourCar,
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Dimens.boxHeight10,
                DropDown<String>(
                  hint: 'Countries',
                  labelBuilder: Text.new,
                  items: const ['Africa'],
                  onChanged: (_) {},
                ),
                Dimens.boxHeight10,
                Row(
                  children: [
                    Flexible(
                      child: DropDown<String>(
                        hint: 'Make',
                        labelBuilder: Text.new,
                        items: const ['Audi'],
                        onChanged: (_) {},
                      ),
                    ),
                    Dimens.boxWidth10,
                    Flexible(
                      child: DropDown<String>(
                        hint: 'Model',
                        labelBuilder: Text.new,
                        items: const ['A8'],
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight20,
                Button(
                  label: 'Search Results',
                  onTap: onTap,
                  width: Dimens.twoHundred,
                ),
              ],
            ),
          ),
        ),
      );
}
