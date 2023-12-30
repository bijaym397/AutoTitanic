import 'package:auto_titanic/controllers/home/home.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellVehicleDetailsView extends StatelessWidget {
  const SellVehicleDetailsView({super.key});

  static const String updateId = 'sell-vehicle-details-id';

  @override
  Widget build(BuildContext context) => Container(
        padding: Dimens.edgeInsets20,
        constraints: BoxConstraints(
          maxWidth: context.sellDetailsWidth,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dimens.boxHeight16,
            AppText(
              'Title',
              style: Styles.headlineSmall,
            ),
            Padding(
              padding: Dimens.edgeInsets20,
              child: const _DropdownDetailsSection(),
            ),
          ],
        ),
      );
}

class _DropdownDetailsSection extends StatelessWidget {
  const _DropdownDetailsSection();

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        id: SellVehicleDetailsView.updateId,
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.fieldWidth,
              child: InputField(
                label: 'Title',
                showLabel: true,
                floatingLabel: true,
                controller: controller.sellTitleTEC,
              ),
            ),
            Padding(
              padding: Dimens.edgeInsets4,
              child: AppText(
                AppStrings.sellVehicleTitleDescription,
                style: Styles.labelLarge.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
            Dimens.boxHeight16,
            SizedBox(
              width: double.maxFinite,
              child: InputEditor(
                controller: controller.sellDescriptionTEC,
                label: 'Description',
                isRequired: true,
                minLines: 5,
                maxLines: 8,
              ),
            ),
            GridView.builder(
              itemCount: VehicleFilter.sellFilters.length,
              shrinkWrap: true,
              padding: Dimens.edgeInsets0_40,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: Dimens.thirtyTwo,
                mainAxisSpacing: 0,
                crossAxisCount: context.isMobileView ? 1 : 2,
                // maxCrossAxisExtent: Dimens.threeHundred,
                mainAxisExtent: Dimens.hundred,
              ),
              itemBuilder: (_, index) {
                var filter = VehicleFilter.sellFilters[index];
                if (filter == VehicleFilter.mileage) {
                  return InputField(
                    controller: controller.sellDetailsTEC(filter),
                    label: filter.label,
                    showLabel: true,
                    isRequired: true,
                  );
                }
                return DropDown<DropDownModel>(
                  maxHeight: Dimens.threeHundred,
                  items: filter.sellDropDownList,
                  labelBuilder: (e) => e.label,
                  hint: filter.label,
                  isRequired: true,
                  showTitle: true,
                  value: controller.sellDetailsValue(filter),
                  onChanged: (data) => controller.onDetailChanged(
                    filter,
                    data: data?.label,
                    updateId: SellVehicleDetailsView.updateId,
                  ),
                );
              },
            ),
            Center(
              child: SizedBox(
                width: context.fieldWidth,
                child: InputField(
                  controller: controller.sellDetailsTEC(VehicleFilter.price),
                  label: 'Sale Price',
                  showLabel: true,
                  isRequired: true,
                  textInputType: TextInputType.number,
                ),
              ),
            ),
            Dimens.boxHeight32,
            Center(
              child: SizedBox(
                width: context.fieldWidth,
                child: Button(
                  label: 'Submit',
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      );
}
