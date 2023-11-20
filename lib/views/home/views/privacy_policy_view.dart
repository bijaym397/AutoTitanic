import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  static const String route = AppRoutes.privacyPolicy;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        showSubscribeCard: true,
        body: SizedBox(
          height: 0.8.ph,
          child: const Center(
            child: Text(AppStrings.privacyPolicy),
          ),
        ),
      );
}
