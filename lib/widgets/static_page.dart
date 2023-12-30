import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StaticPage extends StatelessWidget {
  const StaticPage({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        title: title,
        bodyBuilder: (_, isHovering) => Padding(
          padding: context.staticPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimens.boxHeight32,
              PageHeadLabel(title),
              AnimatedLines(isHovering: isHovering),
              Dimens.boxHeight16,
              HTMLWidget(content: content),
            ],
          ),
        ),
      );
}
