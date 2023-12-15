import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsCarousel extends StatelessWidget {
  const CarsCarousel({
    super.key,
    required this.controller,
    required this.carouselList,
    required this.duration,
    this.isFirst = false,
  });

  final bool isFirst;
  final CarouselController controller;
  final Duration duration;
  final List<List<String>> carouselList;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets0_16.copyWith(
          top: isFirst ? Dimens.eight : null,
        ),
        child: ObxValue<RxBool>(
          (isHovering) => TapHandler(
            onHover: (value) {
              isHovering.value = value;
              if (value) {
                controller.stopAutoPlay();
              } else {
                controller.startAutoPlay();
              }
            },
            showArrowCursor: true,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                CarouselSlider(
                  key: ValueKey(controller.hashCode),
                  carouselController: controller,
                  options: CarouselOptions(
                    autoPlay: true,
                    height: AppConstants.carouselHeight,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: true,
                    viewportFraction: 1,
                    disableCenter: false,
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    autoPlayInterval: duration,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                  ),
                  items: List.generate(
                    AppConstants.carouselItemCount,
                    (i) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          AppConstants.vehiclesPerItem,
                          (j) => CarCard(
                            image: carouselList[i][j],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                $CarouselMoveButton(isHovering: isHovering.value, controller: controller, isPreviousIcon: true),
                $CarouselMoveButton(isHovering: isHovering.value, controller: controller, isPreviousIcon: false),
              ],
            ),
          ),
          false.obs,
        ),
      );
}

class $CarouselMoveButton extends StatelessWidget {
  const $CarouselMoveButton({
    super.key,
    required this.isHovering,
    required this.controller,
    required this.isPreviousIcon,
  });

  final bool isHovering;
  final CarouselController controller;
  final bool isPreviousIcon;

  @override
  Widget build(BuildContext context) => AnimatedPositioned(
        right: isPreviousIcon
            ? null
            : isHovering
                ? -Dimens.ten
                : Dimens.ten,
        left: !isPreviousIcon
            ? null
            : isHovering
                ? -Dimens.ten
                : Dimens.ten,
        duration: AppConstants.fastAnimationDuration,
        child: AnimatedOpacity(
          opacity: isHovering ? 1 : 0,
          duration: AppConstants.animationDuration,
          child: TapHandler(
            onTap: isPreviousIcon ? controller.previousPage : controller.nextPage,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(Dimens.eight),
                border: Border.all(color: AppColors.grey),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(Dimens.two, Dimens.two),
                    color: Colors.grey.shade300,
                    blurRadius: Dimens.eight,
                    spreadRadius: Dimens.two,
                  ),
                ],
              ),
              child: SizedBox(
                height: Dimens.forty,
                width: Dimens.forty,
                child: AppIcon(
                  isPreviousIcon ? Icons.chevron_left_rounded : Icons.chevron_right_rounded,
                  color: AppColors.red,
                ),
              ),
            ),
          ),
        ),
      );
}
