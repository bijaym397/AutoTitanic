import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    super.key,
    this.body,
    this.bodyBuilder,
    this.showSubscribeCard = false,
  }) : assert(
          body != null || bodyBuilder != null,
          'Both body and bodyBuilder cannot be null',
        );

  final Widget? body;
  final Widget Function(BuildContext, bool)? bodyBuilder;
  final bool showSubscribeCard;

  @override
  Widget build(BuildContext context) => Scaffold(
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
                  SizedBox(
                    width: 0.6.pw,
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
