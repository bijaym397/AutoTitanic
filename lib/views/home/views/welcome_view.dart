import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  static const String route = AppRoutes.welcome;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        bodyBuilder: (_, isHovering) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dimens.boxHeight32,
            const PageHeadLabel(AppStrings.welcome),
            AnimatedLines(isHovering: isHovering),
            Dimens.boxHeight16,
            const HTMLWidget(content: StringData.welcome),
            Padding(
              padding: Dimens.edgeInsets0_16,
              child: Row(
                children: [
                  Image.asset(
                    AssetConstants.getOnPlaystore,
                    height: Dimens.eighty,
                  ),
                  Dimens.boxWidth20,
                  Image.asset(
                    AssetConstants.getOnAppstore,
                    height: Dimens.eighty,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
