import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,
    required this.globalKey,
  });

  final GlobalKey<ScaffoldState> globalKey;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: SizedBox(
          height: 1.ph,
          width: 0.5.pw,
          child: ListView.builder(
            itemCount: Vehicle.values.length,
            padding: Dimens.edgeInsets8_16,
            shrinkWrap: true,
            itemBuilder: (_, i) => _DrawerItem(
              Vehicle.values[i],
              globalKey: globalKey,
            ),
          ),
        ),
      );
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem(
    this.vehicle, {
    required this.globalKey,
  });

  final Vehicle vehicle;
  final GlobalKey<ScaffoldState> globalKey;

  @override
  Widget build(BuildContext context) => GetBuilder<CommonController>(
        builder: (controller) => Theme(
          data: kAppTheme.copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: AppText(vehicle.label),
            maintainState: true,
            initiallyExpanded: vehicle == controller.selectedVehicle,
            childrenPadding: Dimens.edgeInsets4,
            children: [
              ...HoverItem.values.indexed.map<Widget>(
                (e) {
                  var item = e.$2;
                  var color = (item == controller.selectedItem && controller.selectedVehicle == vehicle) ? AppColors.red : AppColors.black;

                  return TapHandler(
                    onTap: () {
                      if (vehicle == Vehicle.cars) {
                        globalKey.currentState?.closeEndDrawer();
                        controller.goToVehicleListing(vehicle, item);
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: Dimens.edgeInsets12_4,
                      child: AppText(
                        item.getLabel(vehicle),
                        isSelectable: false,
                        style: const TextStyle().copyWith(
                          color: color,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
}
