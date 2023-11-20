import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/navigators/navigators.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  static const String route = AppRoutes.contactUs;

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.contactUs),
        ),
      );
}
