import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/repositories/repositories.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:get/get.dart';

class InventoryBinding implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<HomeController>()) {
      HomeBinding().dependencies();
    }
    Get.lazyPut<InventoryController>(
      () => InventoryController(
        InventoryViewModel(
          InventoryRepository(),
        ),
      ),
    );
  }
}
