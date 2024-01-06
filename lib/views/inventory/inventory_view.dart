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
        title: 'Search Results',
        showAppBarImage: true,
        isWhiteBackground: true,
        body: Padding(
          padding: Dimens.edgeInsets0_40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!context.isMobileView) ...[
                Expanded(
                  flex: context.isDesktopView ? 1 : 2,
                  child: const $FilterColumn(),
                ),
                Dimens.boxWidth16,
              ],
              Expanded(
                flex: context.isDesktopView ? 4 : 5,
                child: GetBuilder<InventoryController>(
                  id: updateId,
                  initState: (_) {
                    Get.find<InventoryController>().getVehicles();
                  },
                  builder: (controller) => Column(
                    children: [
                      if (context.isMobileView) ...[
                        const FilterRow(),
                        Dimens.boxHeight16,
                      ],
                      const PaginationRow(),
                      if (controller.vehicles.isEmpty)
                        SizedBox(
                          height: 0.5.ph,
                          child: const AppLoader(),
                        )
                      else
                        ListView.separated(
                          itemCount: controller.vehicles.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: Dimens.edgeInsets0_20,
                          separatorBuilder: (_, __) => context.isMobileView ? Dimens.boxHeight20 : Dimens.boxHeight32,
                          itemBuilder: (_, index) => _InventoryCard(controller.vehicles[index]),
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

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Button(
              label: 'Filters',
              icon: Icons.tune_rounded,
              onTap: () {},
            ),
          ),
          Dimens.boxWidth16,
          const Expanded(
            child: _SortButton(),
          ),
        ],
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
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Dimens.hundred,
              minWidth: Dimens.sixtyFour,
            ),
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
          if (!context.isMobileView) ...[
            Dimens.boxWidth16,
            AppText(
              'Sort',
              style: Styles.bodyMedium,
            ),
            Dimens.boxWidth4,
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Dimens.twoHundred,
                minWidth: Dimens.oneHunderFifty,
              ),
              child: const _SortButton(),
            ),
          ],
        ],
      );
}

class _SortButton extends StatelessWidget {
  const _SortButton();

  @override
  Widget build(BuildContext context) => GetX<InventoryController>(
        builder: (controller) => DropDown<SortBy>(
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
      );
}

class _InventoryCard extends StatelessWidget {
  const _InventoryCard(this.data);

  final InventoryModel data;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: context.inventoryAspectRatio,
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
            child: LayoutBuilder(builder: (_, __) {
              final children = [
                Expanded(
                  flex: context.isDesktopView || context.isMobileView ? 4 : 3,
                  child: InventoryImages(data.media),
                ),
                Expanded(
                  flex: 4,
                  child: InventoryDetails(data),
                ),
              ];
              if (context.isMobileView) {
                return Column(children: children);
              }
              return Row(children: children);
            }),
          ),
        ),
      );
}
