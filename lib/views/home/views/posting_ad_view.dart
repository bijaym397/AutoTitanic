import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PostingAdView extends StatelessWidget {
  const PostingAdView({super.key});

  static const String route = AppRoutes.postingAd;

  @override
  Widget build(BuildContext context) => const StaticPage(
        title: AppStrings.postingNewAdvert,
        content: StringData.postingAdvert,
      );
}
