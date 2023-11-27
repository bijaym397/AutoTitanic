import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarsCarousel extends StatelessWidget {
  const CarsCarousel({
    super.key,
    required this.controller,
  });

  final CarouselController controller;

  @override
  Widget build(BuildContext context) => CarouselSlider(
        carouselController: controller,
        options: CarouselOptions(
          autoPlay: true,
          height: Dimens.fourHundredFifty,
          scrollDirection: Axis.horizontal,
          enableInfiniteScroll: true,
          viewportFraction: 1,
          disableCenter: false,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          autoPlayInterval: controller.duration,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
        ),
        items: List.generate(
          3,
          (e) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(4, (e) => const CarCard()),
            ],
          ),
        ),
      );
}
