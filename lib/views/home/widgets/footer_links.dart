import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterLinks extends StatelessWidget {
  const FooterLinks({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (controller) => Row(
          children: [
            Expanded(child: $LinkColumn(links: controller.footer1)),
            Expanded(child: $LinkColumn(links: controller.footer2)),
            const Expanded(child: Dimens.box0),
            const Expanded(child: Dimens.box0),
          ],
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
                child: TapHandler(
                  onTap: () => Get.toNamed(e.route),
                  child: Padding(
                    padding: Dimens.edgeInsets8_4,
                    child: Text(
                      e.label,
                      style: context.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );
}
