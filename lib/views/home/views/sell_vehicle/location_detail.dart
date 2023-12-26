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
              initState: (_) {
                Get.find<HomeController>().selectedVehicleCategory = Utility.vehicleFromRoute().$1;
              },
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
                  const _ImageSection(),
                  Dimens.boxHeight10,
                  Obx(
                    () => InputField(
                      controller: controller.vehicleVideoTEC,
                      label: 'Link to Video',
                      showLabel: true,
                      floatingLabel: true,
                      validator: controller.videoLinkValidator,
                      onChanged: controller.onVideoLinkChanged,
                      suffixIcon: FieldSuffixLoader(
                        showIcon: controller.vehicleVideoTEC.text.trim().isNotEmpty,
                        isError: controller.videoLinkError != null,
                        isLoading: controller.isValidatingLink,
                      ),
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

class _ImageSection extends StatelessWidget {
  const _ImageSection();

  @override
  Widget build(BuildContext context) => GetX<HomeController>(
        builder: (controller) => SizedBox(
          height: Dimens.hundred,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.selectedImages.length + 1,
            separatorBuilder: (_, __) => Dimens.boxWidth16,
            controller: controller.imageScrollController,
            itemBuilder: (_, index) {
              if (index == controller.selectedImages.length) {
                return AddImage(
                  onTap: () async {
                    var files = await FileManager.pickImages();
                    controller.selectedImages.addAll(files);
                    controller.selectedImages = [...controller.selectedImages.take(20)];
                    controller.update([SellVehicleLocationView.updateId]);
                    await Future.delayed(Duration.zero);
                    controller.animateToLast();
                  },
                );
              }
              var image = controller.selectedImages[index];
              return UnconstrainedBox(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topRight,
                  children: [
                    AppImage(
                      bytes: image.bytes!,
                      name: image.name,
                      dimensions: Dimens.eighty,
                      radius: Dimens.eight,
                      isNetworkImage: false,
                      fit: BoxFit.contain,
                    ),
                    TapHandler(
                      onTap: () {
                        controller.selectedImages.removeAt(index);
                        controller.update([SellVehicleLocationView.updateId]);
                      },
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: AppColors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: Dimens.edgeInsets4,
                          child: Icon(
                            Icons.close_rounded,
                            color: AppColors.white,
                            size: Dimens.sixteen,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
