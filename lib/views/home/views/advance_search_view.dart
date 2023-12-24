import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvanceSearchView extends StatelessWidget {
  const AdvanceSearchView({super.key});

  static const String route = AppRoutes.advanceSearch;

  static const String updateId = 'advance-search-view-id';

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        showAppBarImage: true,
        isWhiteBackground: true,
        body: GetBuilder<HomeController>(
          id: updateId,
          initState: (_) {
            Get.find<HomeController>().selectedAdvanceSearchType = AdvanceSearchType.allVehicle;
          },
          builder: (controller) => Padding(
            padding: Dimens.edgeInsets20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.grey),
                borderRadius: BorderRadius.circular(Dimens.twelve),
              ),
              child: SizedBox(
                height: 0.7.ph,
                child: Padding(
                  padding: Dimens.edgeInsets40,
                  child: Column(
                    children: [
                      const _SearchHeader(),
                      const Divider(color: AppColors.grey),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: SingleChildScrollView(
                              padding: Dimens.edgeInsets0_40,
                              child: Column(
                                children: [
                                  CountryPicker(
                                    showStates: true,
                                    space: Dimens.thirtyTwo,
                                    currentCountry: controller.selectedCountry,
                                    currentState: controller.selectedState,
                                    onCountryChanged: controller.onCountryChanged,
                                    onStateChanged: controller.onStateChanged,
                                  ),
                                  GridView.builder(
                                    itemCount: VehicleFilter.advanceFilters.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    padding: Dimens.edgeInsets0,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: Dimens.thirtyTwo,
                                      mainAxisSpacing: Dimens.sixteen,
                                      maxCrossAxisExtent: Dimens.twoHundredFifty,
                                      mainAxisExtent: Dimens.fortyEight,
                                    ),
                                    itemBuilder: (_, index) {
                                      var filter = VehicleFilter.advanceFilters[index];
                                      if (filter == VehicleFilter.mileage) {
                                        return InputField(
                                          controller: controller.sellDetailsTEC(filter),
                                          hint: filter.label,
                                        );
                                      }
                                      return DropDown<DropDownModel>(
                                        maxHeight: Dimens.threeHundred,
                                        items: filter.sellDropDownList,
                                        labelBuilder: (e) => e.label,
                                        hint: filter.label,
                                        value: controller.sellDetailsValue(filter),
                                        onChanged: (data) => controller.onDetailChanged(
                                          filter,
                                          data: data?.label,
                                          updateId: updateId,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Dimens.boxWidth16,
                          Expanded(
                            child: Padding(
                              padding: Dimens.edgeInsets0_40,
                              child: Button(
                                makeResponsive: true,
                                label: 'Search Results',
                                onTap: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _SearchHeader extends StatelessWidget {
  const _SearchHeader();

  @override
  Widget build(BuildContext context) => GetX<HomeController>(
        builder: (controller) => Row(
          children: [
            AppText(
              AppStrings.advanceSearch.toUpperCase(),
              style: Styles.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Dimens.boxWidth16,
            ...List.generate(
              AdvanceSearchType.values.length,
              (i) {
                var type = AdvanceSearchType.values[i];
                return _TitleButton(
                  label: type.label(controller.commonController.selectedVehicle ?? Vehicle.cars),
                  isSelected: controller.selectedAdvanceSearchType == type,
                  onTap: () => controller.selectedAdvanceSearchType = type,
                );
              },
            ),
            const Spacer(),
            DefaultTextStyle(
              style: Styles.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
              child: Row(
                children: [
                  const AppIcon(Icons.arrow_right_rounded),
                  const AppText('(80)'),
                  AppText(
                    (controller.commonController.selectedVehicle ?? Vehicle.cars).label.toUpperCase(),
                    style: const TextStyle().copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _TitleButton extends StatelessWidget {
  const _TitleButton({
    required this.label,
    this.onTap,
    required this.isSelected,
  });

  final String label;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets8_0,
        child: Button(
          label: label,
          onTap: onTap,
          color: isSelected ? null : AppColors.grey,
          hoverColor: AppColors.primary,
          textColor: isSelected ? null : AppColors.black,
        ),
      );
}
