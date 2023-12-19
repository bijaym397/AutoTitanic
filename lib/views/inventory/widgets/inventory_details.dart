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
            // SizedBox(
            //   height: Dimens.thirtyTwo,
            //   child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: data.labels.length,
            //     separatorBuilder: (_, __) => Dimens.boxWidth8,
            //     itemBuilder: (_, index) => _InventoryLabel(data.labels[index]),
            //   ),
            // ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        data.price.formattedPrice,
                        style: Styles.titleLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline_rounded),
                        label: const AppText('Save'),
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
                  Dimens.boxHeight8,
                  AppText(
                    data.details,
                    style: Styles.labelLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
