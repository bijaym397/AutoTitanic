import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = AppRoutes.home;

  @override
  Widget build(BuildContext context) {
    AppLog('ScreenWidth ${MediaQuery.of(context).size.width}');
    AppLog.info('ScreenWidth ${Get.width}');
    return GetBuilder<HomeController>(
      initState: (_) {
        Get.find<HomeController>()
          ..checkRoute()
          ..generateCarsData();
      },
      builder: (controller) => ScreenWrapper(
        showFilterCard: true,
        onFilterSearch: () => RouteManagement.goToSearch(
          controller.selectedVehicle ?? Vehicle.cars,
        ),
        body: Column(
          children: [
            Dimens.boxHeight12,
            const TitleText(
              AppStrings.featuredCars,
              color: AppColors.primary,
            ),
            ListView.builder(
              itemCount: 1,
              // itemCount: AppConstants.featuredCarsCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                var carouselController = CarouselController();
                return CarsCarousel(
                  isFirst: index == 0,
                  carouselList: controller.carsList[index],
                  duration: carouselController.duration,
                  controller: carouselController,
                );
              },
            ),
            const TitleText(
              AppStrings.recentlyPostedCars,
              color: AppColors.accent,
            ),
            ListView.builder(
              itemCount: 1,
              // itemCount: AppConstants.recentCarsCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                var carouselController = CarouselController();
                return CarsCarousel(
                  carouselList: controller.carsList[index],
                  duration: carouselController.duration,
                  controller: carouselController,
                );
              },
            ),
            Dimens.boxHeight48,
            const BrandCard(),
          ],
        ),
      ),
    );
  }
}
