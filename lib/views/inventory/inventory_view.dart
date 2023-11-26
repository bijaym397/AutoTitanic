import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryView extends StatelessWidget {
  InventoryView({super.key})
      : vehicle = Get.arguments as Vehicle? ?? Vehicle.cars;

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        showAppBarImage: true,
        isWhiteBackground: true,
        bodyBuilder: (_, isHovering) => GetBuilder<InventoryController>(
          builder: (controller) => const Padding(
            padding: Dimens.edgeInsets0_40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                $FilterColumn(),
              ],
            ),
          ),
        ),
      );
}

class $FilterColumn extends StatelessWidget {
  const $FilterColumn({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FILTER BY PRICE',
            style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 2,
            width: Dimens.twenty,
            color: AppColors.red,
          ),
          Container(
            color: AppColors.grey,
            margin: Dimens.edgeInsets10,
            padding: Dimens.edgeInsets12,
            width: 0.15.pw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VEHICLE FILTERS',
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 2,
                  width: Dimens.twenty,
                  color: AppColors.red,
                ),
                Dimens.boxHeight32,
                Text(
                  '80 Vehicles Matching',
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Dimens.boxHeight16,
                ...VehicleFilter.values.map<Widget>(
                  (e) => DropDown<String>(
                    hint: e.label,
                    items: [e.label],
                    labelBuilder: Text.new,
                    onChanged: (_) {},
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
