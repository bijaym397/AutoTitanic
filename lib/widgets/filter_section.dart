import 'package:auto_titanic/controllers/controllers.dart';
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
            alignment: Alignment.centerLeft,
            children: [
              Image.asset(
                AssetConstants.homeTopBg,
                height: 0.4.ph,
                width: Dimens.screenWidth,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              Positioned(
                left: Dimens.fortyEight,
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
            padding: Dimens.edgeInsets24_16,
            child: Column(
              children: [
                AppText(
                  '${AppStrings.findYour} ${(Get.find<HomeController>().selectedVehicle ?? Vehicle.cars).label}',
                  style: Styles.titleLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Dimens.boxHeight10,
                const CountryPicker(),
                Row(
                  children: [
                    Flexible(
                      child: DropDown<String>(
                        hint: 'Make',
                        labelBuilder: (value) => value,
                        items: VehicleFilter.make.sellDropDownList,
                        onChanged: (_) {},
                      ),
                    ),
                    Dimens.boxWidth10,
                    Flexible(
                      child: DropDown<String>(
                        hint: 'Model',
                        labelBuilder: (value) => value,
                        items: VehicleFilter.model.sellDropDownList,
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight10,
                Row(
                  children: [
                    Flexible(
                      child: DropDown<num>(
                        hint: 'Min Price',
                        labelBuilder: (value) => '$value',
                        items: VehicleFilter.price.minList,
                        onChanged: (_) {},
                      ),
                    ),
                    Dimens.boxWidth10,
                    Flexible(
                      child: DropDown<num>(
                        hint: 'Max Price',
                        labelBuilder: (value) => '$value',
                        items: VehicleFilter.price.maxList,
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
                Dimens.boxHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LinkText(
                      AppStrings.resetFilters,
                      onTap: () {},
                    ),
                    const LinkText(
                      AppStrings.moreOptions,
                      onTap: RouteManagement.goToAdvanceSearch,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
