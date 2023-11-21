import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html_v3/flutter_html.dart';

class HTMLWidget extends StatelessWidget {
  const HTMLWidget({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) => Html(
        data: content,
        style: {
          'a': Style(
            color: AppColors.red,
          ),
        },
        onLinkTap: (url, context, attributes, element) {
          if (url != null && url.isNotEmpty) {
            Utility.launchURL(url);
          }
        },
      );
}
