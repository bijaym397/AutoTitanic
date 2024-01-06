import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InventoryDetails extends StatelessWidget {
  const InventoryDetails(this.data, {super.key});

  final InventoryModel data;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets16_12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  data.amount,
                  style: Styles.titleLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Button.icon(
                  onTap: () {},
                  icon: Icons.favorite_outline_rounded,
                  label: 'Save',
                ),
              ],
            ),
            AppText(
              data.name,
              style: Styles.titleMedium,
            ),
            if (data.variants.isNotEmpty)
              AppText(
                data.variants,
                style: Styles.labelLarge,
              ),
            AppText(
              data.details,
              style: Styles.labelMedium,
              softWrap: true,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  data.seller,
                  style: Styles.labelLarge,
                ),
              ],
            ),
            _ReviewAndLocation(data),
          ],
        ),
      );
}

class _ReviewAndLocation extends StatelessWidget {
  const _ReviewAndLocation(this.data);

  final InventoryModel data;

  @override
  Widget build(BuildContext context) {
    final children = [
      Row(
        children: [
          AppIcon(
            Icons.star_border_rounded,
            size: Dimens.twenty,
          ),
          AppText(
            data.customerReviews,
            style: Styles.labelMedium,
          ),
        ],
      ),
      if (context.isMobileView) Dimens.boxWidth10,
      Row(
        children: [
          AppIcon(
            Icons.location_on_outlined,
            size: Dimens.twenty,
          ),
          AppText(
            data.toAddress,
            style: Styles.labelMedium,
          ),
        ],
      ),
    ];
    if (context.isMobileView) {
      return Row(children: children);
    }
    return Column(children: children);
  }
}
