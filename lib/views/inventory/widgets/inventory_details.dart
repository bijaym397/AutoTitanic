import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
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
            AppText(
              data.variant,
              style: Styles.labelLarge,
            ),
            // Dimens.boxHeight8,
            // AppText(
            //   data.features.join(' | '),
            //   style: Styles.labelMedium,
            // ),
            AppText(
              data.details,
              style: Styles.labelMedium,
              softWrap: true,
            ),
            const Divider(),
            AppText(
              data.seller,
              style: Styles.labelLarge,
            ),
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
            Row(
              children: [
                AppIcon(
                  Icons.location_on_outlined,
                  size: Dimens.twenty,
                ),
                AppText(
                  data.address.toAddress,
                  style: Styles.labelMedium,
                ),
              ],
            ),
          ],
        ),
      );
}

// class _InventoryLabel extends StatelessWidget {
//   const _InventoryLabel(this.label);

//   final LabelModel label;

//   @override
//   Widget build(BuildContext context) => UnconstrainedBox(
//         child: DecoratedBox(
//           decoration: BoxDecoration(
//             color: label.color,
//             borderRadius: BorderRadius.circular(Dimens.four),
//           ),
//           child: Padding(
//             padding: Dimens.edgeInsets8_4,
//             child: Text(
//               label.label,
//               style: Styles.labelSmall.copyWith(
//                 color: AppColors.white,
//               ),
//             ),
//           ),
//         ),
//       );
// }
