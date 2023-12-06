import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SellMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var paths = route!.split('/');
    var endpoint = paths.last;
    if (AppRoutes.sell.contains(endpoint)) {
      var vehicle = Vehicle.fromRoute(paths.first);
      return RouteSettings(name: '${AppRoutes.sell}${vehicle.route}');
    }
    return null;
  }
}
