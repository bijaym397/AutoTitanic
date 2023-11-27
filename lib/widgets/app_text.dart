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
        )
      : Text(
          data,
          style: style,
          textAlign: textAlign,
        );
}
