import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/material.dart';

class SafetyNoticeView extends StatelessWidget {
  const SafetyNoticeView({super.key});

  static const String route = AppRoutes.safetyNotice;

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.safetyNotice),
        ),
      );
}
