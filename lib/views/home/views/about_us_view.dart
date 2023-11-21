import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  static const String route = AppRoutes.aboutUs;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        bodyBuilder: (_, isHovering) => Padding(
          padding: Dimens.edgeInsetsR200,
          child: SizedBox(
            height: 0.4.ph,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimens.boxHeight32,
                const PageHeadLabel(AppStrings.aboutUs),
                AnimatedLines(isHovering: isHovering),
                Dimens.boxHeight16,
                const HTMLWidget(content: StringData.aboutUs),
              ],
            ),
          ),
        ),
      );
}
