import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BuyNewVehicleView extends StatelessWidget {
  const BuyNewVehicleView({super.key});

  static const String route = AppRoutes.buyingNewVehicle;

  @override
  Widget build(BuildContext context) => const StaticPage(
        title: AppStrings.buyingNew,
        content: StringData.buyingNewVehicle,
      );
}
