import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SellMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var paths = route!.split('/');
    var endpoint = paths.last;
    if (AppRoutes.sell.contains(endpoint)) {
      // TODO: Check here for user login state
    }
    return null;
  }
}
