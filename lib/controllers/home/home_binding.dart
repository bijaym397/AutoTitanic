import 'package:auto_titanic/controllers/home/home_controller.dart';
import 'package:auto_titanic/repositories/repositories.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        HomeViewModel(
          HomeRepository(),
        ),
      ),
    );
  }
}
