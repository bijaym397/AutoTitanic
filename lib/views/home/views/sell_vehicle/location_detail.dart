import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellVehicleLocationView extends StatelessWidget {
  const SellVehicleLocationView({super.key});

  static const String updateId = 'sell-vehicle-location-id';

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 0.6.ph,
        child: Container(
          margin: Dimens.edgeInsets16,
          padding: Dimens.edgeInsets40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.twentyFour),
            color: AppColors.white,
          ),
          alignment: Alignment.center,
          child: SizedBox(
            width: Dimens.fiveHundred,
            child: GetBuilder<HomeController>(
              id: updateId,
              builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const PageHeadLabel(AppStrings.postAdvert),
                  Dimens.boxHeight32,
                  Flexible(
                    child: DropDown<Vehicle>(
                      hint: AppStrings.category,
                      items: Vehicle.values,
                      labelBuilder: (e) => e.label,
                      value: controller.selectedVehicleCategory,
                      onChanged: controller.onCategoryChange,
                    ),
                  ),
                  Dimens.boxHeight16,
                  CSCPicker(
                    showStates: true,
                    showCities: false,
                    dropdownDecoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(Dimens.eight),
                    ),
                    countryFilter: AppConstants.allowedCountries,
                    currentCountry: controller.selectedCountry,
                    currentState: controller.selectedState,
                    onCountryChanged: controller.onCountryChanged,
                    onStateChanged: controller.onStateChanged,
                    onCityChanged: (_) {},
                    // layout: Layout.vertical,
                  ),
                  Dimens.boxHeight16,
                  Flexible(
                    child: DropDown<SellerType>(
                      hint: AppStrings.seller,
                      items: SellerType.values,
                      labelBuilder: (e) => e.label,
                      value: controller.selectedSellerType,
                      onChanged: controller.onSellerTypeChange,
                    ),
                  ),
                  const Spacer(),
                  Button(
                    onTap: controller.isNextButtonEnabled ? controller.onChangeSellPage : null,
                    label: 'Next',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
