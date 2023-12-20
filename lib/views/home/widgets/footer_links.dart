import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterLinks extends StatelessWidget {
  const FooterLinks({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<CommonController>(
        builder: (controller) => Padding(
          padding: Dimens.edgeInsets0_16,
          child: Row(
            children: [
              if (context.isMobileView) ...[
                Expanded(
                  child: $LinkColumn(
                    links: [
                      ...controller.footer1,
                      ...controller.footer2,
                    ],
                  ),
                ),
              ] else ...[
                Expanded(child: $LinkColumn(links: controller.footer1)),
                Expanded(child: $LinkColumn(links: controller.footer2)),
              ],
              if (context.isWeb) ...[
                const Expanded(child: Dimens.box0),
                const Expanded(child: Dimens.box0),
              ],
            ],
          ),
        ),
      );
}

class $LinkColumn extends StatelessWidget {
  const $LinkColumn({
    super.key,
    required this.links,
  });

  final List<LinkModel> links;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: links
            .map(
              (e) => Padding(
                padding: Dimens.edgeInsets4,
                child: ObxValue<RxBool>(
                  (isHovering) => TapHandler(
                    onTap: () => Get.toNamed(e.route),
                    onHover: (value) {
                      isHovering.value = value;
                    },
                    child: Padding(
                      padding: Dimens.edgeInsets8_4,
                      child: AppText(
                        '>> ${e.label}',
                        isSelectable: false,
                        style: Styles.labelMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isHovering.value ? AppColors.primary : null,
                        ),
                      ),
                    ),
                  ),
                  false.obs,
                ),
              ),
            )
            .toList(),
      );
}
