import 'package:auto_titanic/controllers/home/home.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellVehicleDetailsView extends StatelessWidget {
  const SellVehicleDetailsView({super.key});

  static const String updateId = 'sell-vehicle-details-id';

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Title',
              style: context.textTheme.headlineSmall,
            ),
            const Padding(
              padding: Dimens.edgeInsets20,
              child: _DropdownDetailsSection(),
            ),
            AppText(
              'Images',
              style: context.textTheme.headlineSmall,
            ),
            const Padding(
              padding: Dimens.edgeInsets20,
              child: _ImageSection(),
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
              width: 0.3.pw,
              child: InputField(
                hint: 'Title',
                controller: controller.sellTitleTEC,
              ),
            ),
            Padding(
              padding: Dimens.edgeInsets4,
              child: AppText(
                AppStrings.sellVehicleTitleDescription,
                style: context.textTheme.labelLarge!.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
            Dimens.boxHeight16,
            SizedBox(
              width: 0.3.pw,
              child: InputField(
                hint: 'Description',
                controller: controller.sellDescriptionTEC,
                minLines: 5,
                maxLines: 8,
              ),
            ),
            GridView.builder(
              itemCount: VehicleFilter.sellFilters.length,
              shrinkWrap: true,
              padding: Dimens.edgeInsets0_40,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: Dimens.thirtyTwo,
                mainAxisSpacing: Dimens.sixteen,
                maxCrossAxisExtent: Dimens.threeHundred,
                mainAxisExtent: Dimens.hundred,
              ),
              itemBuilder: (_, index) {
                var filter = VehicleFilter.sellFilters[index];
                if (filter == VehicleFilter.mileage) {
                  return InputField(
                    controller: controller.sellDetailsTEC(filter),
                    hint: filter.label,
                    showLabel: true,
                    isRequired: true,
                  );
                }
                return DropDown(
                  maxHeight: Dimens.threeHundred,
                  items: filter.sellDropDownList,
                  labelBuilder: (label) => label,
                  hint: filter.label,
                  isRequired: true,
                  showTitle: true,
                  value: controller.sellDetailsValue(filter),
                  onChanged: (data) => controller.onDetailChanged(filter, data),
                );
              },
            ),
            SizedBox(
              width: 0.3.pw,
              child: InputField(
                controller: controller.sellDetailsTEC(VehicleFilter.price),
                hint: 'Sale Price',
                showLabel: true,
                isRequired: true,
                textInputType: TextInputType.number,
              ),
            )
          ],
        ),
      );
}

class _ImageSection extends StatelessWidget {
  const _ImageSection();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const AppText('images'),
          Button(
            label: 'Choose Files',
            onTap: () async {
              var file = await FileManager.pickImages();
              AppLog(file);
            },
          ),
        ],
      );
}
