import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/repositories/repositories.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:get/get.dart';

class CommonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CommonController(
        CommonViewModel(
          CommonRepository(
            Get.find(),
          ),
        ),
      ),
    );
  }
}
