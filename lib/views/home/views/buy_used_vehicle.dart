import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BuyUsedVehicleView extends StatelessWidget {
  const BuyUsedVehicleView({super.key});

  static const String route = AppRoutes.buyingUsedVehicle;

  @override
  Widget build(BuildContext context) => const StaticPage(
        title: AppStrings.buyingUsed,
        content: StringData.buyingUsedVehicle,
      );
}
