import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryView extends StatelessWidget {
  InventoryView({super.key}) : vehicle = Get.arguments as Vehicle? ?? Vehicle.fromRoute(Uri.base.toString().split('/').last);

  final Vehicle vehicle;

  static const String route = AppRoutes.search;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        showAppBarImage: true,
        isWhiteBackground: true,
        body: Padding(
          padding: Dimens.edgeInsets0_40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: $FilterColumn()),
              Dimens.boxWidth16,
              Expanded(
                flex: 4,
                child: GetBuilder<InventoryController>(
                  builder: (controller) => ListView.separated(
                    itemCount: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => Dimens.boxHeight32,
                    itemBuilder: (_, index) => _InventoryCard(controller.inventory),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class _InventoryCard extends StatelessWidget {
  const _InventoryCard(this.data);

  final InventoryModel data;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => AspectRatio(
          aspectRatio: constraints.isDesktopView ? 7 / 2 : 5 / 2,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(Dimens.eight),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: Dimens.eight,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.eight),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: InventoryImages(data.images),
                  ),
                  Expanded(
                    flex: 4,
                    child: InventoryDetails(data),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
