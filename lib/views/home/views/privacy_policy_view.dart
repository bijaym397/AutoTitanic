import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  static const String route = AppRoutes.privacyPolicy;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        bodyBuilder: (_, isHovering) => Padding(
          padding: Dimens.edgeInsetsR200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimens.boxHeight32,
              const PageHeadLabel(AppStrings.privacyPolicy),
              AnimatedLines(isHovering: isHovering),
              Dimens.boxHeight16,
              const HTMLWidget(content: StringData.privacyPolicy),
            ],
          ),
        ),
      );
}
