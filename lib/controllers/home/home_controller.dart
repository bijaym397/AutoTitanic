import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:get/get.dart';

part 'mixins/api_mixin.dart';

class HomeController extends GetxController with HomeAPIMixin {
  HomeController(this._viewModel);

  final HomeViewModel _viewModel;

  final Rx<Vehicle?> _selectedVehicle = Rx<Vehicle?>(null);
  Vehicle? get selectedVehicle => _selectedVehicle.value;
  set selectedVehicle(Vehicle? value) => _selectedVehicle.value = value;

  // ----------------- API CALLS -------------------
}
