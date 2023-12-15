import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellVehicleLocationView extends StatelessWidget {
  const SellVehicleLocationView({super.key});

  static const String updateId = 'sell-vehicle-location-id';

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 0.7.ph,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Center(child: PageHeadLabel(AppStrings.postAdvert)),
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
                  CountryPicker(
                    showStates: true,
                    currentCountry: controller.selectedCountry,
                    currentState: controller.selectedState,
                    onCountryChanged: controller.onCountryChanged,
                    onStateChanged: controller.onStateChanged,
                  ),
                  Dimens.boxHeight8,
                  Divider(
                    indent: Dimens.twentyFour,
                    endIndent: Dimens.twentyFour,
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  Dimens.boxHeight8,
                  AppText(
                    'Images',
                    style: Styles.titleMedium,
                  ),
                  AppText(
                    AppStrings.imageSubtitle,
                    style: Styles.labelLarge.copyWith(color: Colors.grey),
                  ),
                  Padding(
                    padding: Dimens.edgeInsets20,
                    child: const _ImageSection(),
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

class _ImageSection extends StatelessWidget {
  const _ImageSection();

  @override
  Widget build(BuildContext context) => GetX<HomeController>(
        builder: (controller) => SizedBox(
          height: Dimens.eighty,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.selectedImages.length + 1,
            separatorBuilder: (_, __) => Dimens.boxWidth8,
            itemBuilder: (_, index) {
              if (index == controller.selectedImages.length) {
                return _AddImageButton();
              }
              var image = controller.selectedImages[index];
              return UnconstrainedBox(
                child: AppImage(
                  bytes: image.bytes!,
                  dimensions: Dimens.sixtyFour,
                  radius: Dimens.eight,
                  isNetworkImage: false,
                ),
              );
            },
          ),
        ),
      );
}

class _AddImageButton extends StatelessWidget {
  _AddImageButton({super.key}) : controller = Get.find<HomeController>();

  final HomeController controller;

  @override
  Widget build(BuildContext context) => UnconstrainedBox(
        child: TapHandler(
          onTap: () async {
            var files = await FileManager.pickImages();
            controller.selectedImages.addAll(files);
            controller.selectedImages = [...controller.selectedImages.take(20)];
            controller.update([SellVehicleLocationView.updateId]);
          },
          child: Container(
            height: Dimens.sixtyFour,
            width: Dimens.sixtyFour,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(Dimens.eight),
              color: AppColors.primary.withOpacity(0.1),
            ),
            alignment: Alignment.center,
            child: const AppIcon(
              Icons.add_rounded,
              color: AppColors.primary,
            ),
          ),
        ),
      );
}
