import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.isSelectable = true,
  });

  final String data;
  final TextStyle? style;
  final bool isSelectable;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) => isSelectable
      ? SelectableText(
          data,
          style: style,
          textAlign: textAlign,
          semanticsLabel: data,
          selectionControls: kIsWeb ? DesktopTextSelectionControls() : MaterialTextSelectionControls(),
        )
      : Text(
          data,
          style: style,
          textAlign: textAlign,
          semanticsLabel: data,
        );
}

class LinkText extends StatelessWidget {
  const LinkText(
    this.label, {
    super.key,
    this.onTap,
    this.style,
    this.color,
  });

  final VoidCallback? onTap;
  final String label;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) => TapHandler(
        onTap: onTap,
        child: AppText(
          label,
          isSelectable: false,
          style: (style ?? Styles.bodyMedium).copyWith(
            color: color ?? AppColors.red,
            decoration: TextDecoration.underline,
            decorationColor: color ?? AppColors.red,
          ),
        ),
      );
}
