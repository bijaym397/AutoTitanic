import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/material.dart';

class PostingAdView extends StatelessWidget {
  const PostingAdView({super.key});

  static const String route = AppRoutes.postingAd;

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.postingNewAdvert),
        ),
      );
}
