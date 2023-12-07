import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class $FilterColumn extends StatelessWidget {
  const $FilterColumn({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey,
            width: Dimens.two,
          ),
          borderRadius: BorderRadius.circular(Dimens.eight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Dimens.boxHeight12,
            AppText(
              '80 Cars found',
              style: context.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            AppText(
              '0 Filters selected',
              style: context.textTheme.labelMedium,
            ),
            Dimens.boxHeight12,
            const Divider(
              color: AppColors.grey,
              thickness: Dimens.two,
              height: Dimens.two,
            ),
            ListView.separated(
              itemCount: VehicleFilter.searchFilters.length,
              shrinkWrap: true,
              padding: Dimens.edgeInsets0_4,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const Divider(
                color: AppColors.grey,
                thickness: Dimens.two,
                height: Dimens.four,
              ),
              itemBuilder: (_, index) => _FilterTile(VehicleFilter.searchFilters[index]),
            ),
          ],
        ),
      );
}

class _FilterTile extends StatelessWidget {
  const _FilterTile(this.filter);
  final VehicleFilter filter;

  @override
  Widget build(BuildContext context) => ObxValue<RxBool>(
        (isOpened) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TapHandler(
              showSplash: false,
              onTap: () {
                isOpened.value = !isOpened.value;
              },
              child: Padding(
                padding: Dimens.edgeInsets12,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      filter.label,
                      style: context.textTheme.labelLarge!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const Text('Any'),
                    Icon(
                      isOpened.value ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded,
                    ),
                  ],
                ),
              ),
            ),
            if (isOpened.value) ...[
              if (filter.filterType.isExpandable) ...[
                ExpandedFilterTile(filter: filter),
              ]
            ],
          ],
        ),
        false.obs,
      );
}
