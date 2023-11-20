import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    super.key,
    required this.body,
    this.showSubscribeCard = false,
  });

  final Widget body;
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
                  body,
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
