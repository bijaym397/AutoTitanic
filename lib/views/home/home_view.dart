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
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        initState: (_) {
          Get.find<HomeController>().generateCarsData();
        },
        builder: (controller) => ScreenWrapper(
          showFilterCard: true,
          onFilterSearch: () => RouteManagement.goToListing(
            controller.selectedVehicle ?? Vehicle.cars,
          ),
          bodyBuilder: (_, isHovering) => Column(
            children: [
              Dimens.boxHeight48,
              const TitleText(AppStrings.featuredCars),
              ...List.generate(
                AppConstants.featuredCarsCount,
                (index) => CarsCarousel(
                  carouselList: controller.carsList[index],
                  controller: CarouselController(),
                ),
              ),
              Dimens.boxHeight48,
              const TitleText(AppStrings.recentlyPostedCars),
              ...List.generate(
                AppConstants.recentCarsCount,
                (index) => CarsCarousel(
                  isFirst: index == 0,
                  carouselList: controller
                      .carsList[AppConstants.featuredCarsCount + index],
                  controller: CarouselController(),
                ),
              ),
              Dimens.boxHeight48,
              const BrandCard(),
            ],
          ),
        ),
      );
}
