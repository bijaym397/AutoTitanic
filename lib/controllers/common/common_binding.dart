import 'package:auto_titanic/controllers/controllers.dart';
import 'package:get/get.dart';

class CommonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CommonController.new);
  }
}
