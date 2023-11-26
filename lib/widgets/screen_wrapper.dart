import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    super.key,
    this.body,
    this.bodyBuilder,
    this.showAppBarImage = false,
    this.showSubscribeCard = false,
    this.isWhiteBackground = false,
  }) : assert(
          body != null || bodyBuilder != null,
          'Both body and bodyBuilder cannot be null',
        );

  final Widget? body;
  final bool showAppBarImage;
  final Widget Function(BuildContext, bool)? bodyBuilder;
  final bool showSubscribeCard;
  final bool isWhiteBackground;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: isWhiteBackground ? AppColors.white : AppColors.grey,
        appBar: const DashboardHeader(),
        body: GetBuilder<HomeController>(
          builder: (controller) => TapHandler(
            showArrowCursor: true,
            onHover: (isHovering) {
              if (isHovering) {
                controller.closeOverlay();
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (showAppBarImage) const $BackgroundImage(),
                  SizedBox(
                    width: Dimens.screenWidth,
                    child: bodyBuilder != null
                        ? ObxValue<RxBool>(
                            (value) => TapHandler(
                              showArrowCursor: true,
                              onHover: (isHovering) {
                                value.value = isHovering;
                              },
                              child: bodyBuilder!(context, value.value),
                            ),
                            false.obs,
                          )
                        : body,
                  ),
                  DashboardFooter(
                    showSubcribeCard: showSubscribeCard,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class $BackgroundImage extends StatelessWidget {
  const $BackgroundImage({
    super.key,
  });

  double get _height => Dimens.twoHundred;

  double get _width => Get.width;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Image.asset(
            AssetConstants.pageHeaderBg,
            height: _height,
            width: _width,
            fit: BoxFit.cover,
          ),
          Container(
            height: _height,
            width: _width,
            color: Colors.black54,
          ),
        ],
      );
}
