import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = AppRoutes.home;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        showSubscribeCard: true,
        bodyBuilder: (_, isHovering) => GetBuilder<HomeController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetConstants.homeTopBg,
                height: 0.4.ph,
                width: Dimens.screenWidth,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              const PageHeadLabel(AppStrings.featuredCars),
              const CarsCarousel(5, moreSpace: true),
              const CarsCarousel(5),
              const CarsCarousel(5),
              Text(
                'Recently Posted Cars',
                style: context.textTheme.titleLarge,
              ),
              const CarsGrid(),
              Dimens.boxHeight48,
            ],
          ),
        ),
      );
}

class CarsCarousel extends StatelessWidget {
  const CarsCarousel(
    this.length, {
    super.key,
    this.moreSpace = false,
  });

  final int length;
  final bool moreSpace;

  @override
  Widget build(BuildContext context) => CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          height: Dimens.fiveHundred,
          scrollDirection: Axis.horizontal,
          enableInfiniteScroll: true,
          viewportFraction: 1,
          disableCenter: false,
        ),
        items: List.generate(
          length,
          (e) => Row(
            children: [
              ...List.generate(
                  moreSpace ? 3 : 4, (e) => CarCard(moreSpace: moreSpace)),
            ],
          ),
        ),
      );
}

class CarsGrid extends StatelessWidget {
  const CarsGrid({super.key});

  @override
  Widget build(BuildContext context) => GridView.builder(
        padding: Dimens.edgeInsets40,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 5 / 7,
          crossAxisSpacing: Dimens.hundred,
          mainAxisSpacing: Dimens.twenty,
        ),
        itemCount: 21,
        itemBuilder: (_, __) => const CarCard(),
      );
}
