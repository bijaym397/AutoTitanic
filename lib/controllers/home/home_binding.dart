import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/repositories/repositories.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    CommonBinding().dependencies();

    Get.lazyPut<HomeController>(
      () => HomeController(
        HomeViewModel(
          HomeRepository(),
        ),
      ),
    );
  }
}
