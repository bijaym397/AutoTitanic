import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsCarousel extends StatelessWidget {
  const CarsCarousel({
    super.key,
    required this.controller,
    required this.carouselList,
    this.isFirst = false,
  });

  final bool isFirst;
  final CarouselController controller;
  final List<List<String>> carouselList;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets0_20.copyWith(
          top: isFirst ? Dimens.eight : null,
        ),
        child: ObxValue<RxBool>(
          (isHovering) => TapHandler(
            onHover: (value) {
              isHovering.value = value;
            },
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CarouselSlider(
                  key: ValueKey(controller.hashCode),
                  carouselController: controller,
                  options: CarouselOptions(
                    autoPlay: true,
                    height: Dimens.fourHundred,
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
                    AppConstants.carouselItemCount,
                    (i) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          AppConstants.carsPerItem,
                          (j) => CarCard(
                            image: carouselList[i][j],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  left: isHovering.value ? -Dimens.ten : Dimens.ten,
                  duration: AppConstants.animationDuration,
                  child: AnimatedOpacity(
                    opacity: isHovering.value ? 1 : 0,
                    duration: AppConstants.animationDuration,
                    child: const ColoredBox(
                      color: Colors.red,
                      child: SizedBox(
                        height: Dimens.forty,
                        width: Dimens.forty,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          false.obs,
        ),
      );
}
