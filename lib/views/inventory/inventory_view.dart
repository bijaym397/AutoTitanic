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

  static const String updateId = 'inventory-view';

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
                  id: updateId,
                  initState: (_) {
                    Get.find<InventoryController>().getVehicles();
                  },
                  builder: (controller) => Column(
                    children: [
                      const PaginationRow(),
                      ListView.separated(
                        itemCount: controller.vehicles.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: Dimens.edgeInsets0_20,
                        separatorBuilder: (_, __) => Dimens.boxHeight32,
                        itemBuilder: (_, index) => _InventoryCard(
                          controller.vehicles[index],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class PaginationRow extends StatelessWidget {
  const PaginationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          AppIconButton(
            icon: Icons.chevron_left_rounded,
            onTap: () {},
          ),
          Dimens.boxWidth8,
          AppIconButton(
            icon: Icons.chevron_right_rounded,
            onTap: () {},
          ),
          const Spacer(),
          SizedBox(
            width: Dimens.hundred,
            child: GetX<InventoryController>(
              builder: (controller) => DropDown(
                hint: 'Page limit:',
                items: AppConstants.pageLimitList,
                labelBuilder: (e) => '$e',
                value: controller.selectedPageLimit,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  controller.selectedPageLimit = value;
                },
              ),
            ),
          ),
          Dimens.boxWidth16,
          AppText(
            'Sort',
            style: Styles.bodyMedium,
          ),
          Dimens.boxWidth4,
          SizedBox(
            width: Dimens.twoHundred,
            child: GetX<InventoryController>(
              builder: (controller) => DropDown(
                hint: 'Sort by:',
                items: SortBy.values,
                labelBuilder: (e) => e.label,
                value: controller.selectedSortBy,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  controller.selectedSortBy = value;
                },
              ),
            ),
          ),
        ],
      );
}

class _InventoryCard extends StatelessWidget {
  const _InventoryCard(this.data);

  final InventoryModel data;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => AspectRatio(
          aspectRatio: 7 / 2,
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
                    child: InventoryImages(data.media),
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
