import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/models/models.dart';
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

  static const String updateId = 'filter-card';

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Container(
        width: Get.width,
        color: AppColors.white,
        alignment: Alignment.center,
        child: SizedBox(
          width: context.isMobileView ? 1.pw : context.screenWidth,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Image.asset(
                AssetConstants.homeTopBg,
                height: context.filterCardHeight,
                width: context.isMobileView ? 1.pw : context.screenWidth,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              Positioned(
                left: context.isMobileView ? 0.05.pw : Dimens.fortyEight,
                right: context.isMobileView ? 0.05.pw : null,
                top: context.isMobileView ? 0.05.pw : null,
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
        width: context.filterCardWidth,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.twelve),
          ),
          child: Padding(
            padding: Dimens.edgeInsets24_16,
            child: GetBuilder<HomeController>(
              id: FilterSection.updateId,
              builder: (controller) => Column(
                children: [
                  AppText(
                    '${AppStrings.findYour} ${(Get.find<CommonController>().selectedVehicle ?? Vehicle.cars).label}',
                    style: Styles.titleLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Dimens.boxHeight10,
                  CountryPicker(
                    currentCountry: controller.selectedFilterCountry,
                    onCountryChanged: controller.onFilterCountryChanged,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: DropDown<DropDownModel>(
                          hint: 'Make',
                          labelBuilder: (e) => e.label,
                          items: VehicleFilter.make.sellDropDownList,
                          value: controller.selectedFilterBrand,
                          onChanged: controller.onFilterBrandChanged,
                        ),
                      ),
                      Dimens.boxWidth10,
                      Flexible(
                        child: DropDown<DropDownModel>(
                          hint: 'Model',
                          labelBuilder: (e) => e.label,
                          items: VehicleFilter.model.sellDropDownList,
                          value: controller.selectedFilterModel,
                          onChanged: controller.onFilterModelChanged,
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
                          value: controller.selectedFilterMinPrice,
                          onChanged: controller.onFilterMinPriceChanged,
                        ),
                      ),
                      Dimens.boxWidth10,
                      Flexible(
                        child: DropDown<num>(
                          hint: 'Max Price',
                          labelBuilder: (value) => '$value',
                          items: VehicleFilter.price.maxList,
                          value: controller.selectedFilterMaxPrice,
                          onChanged: controller.onFilterMaxPriceChanged,
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight20,
                  Button(
                    label: 'Search Results',
                    onTap: () {
                      controller.resultCount();
                      onTap();
                    },
                    width: Dimens.twoHundred,
                  ),
                  Dimens.boxHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LinkText(
                        AppStrings.resetFilters,
                        onTap: controller.resetFilters,
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
        ),
      );
}
