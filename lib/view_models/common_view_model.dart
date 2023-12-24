import 'package:auto_titanic/repositories/repositories.dart';
import 'package:auto_titanic/utils/utils.dart';

class CommonViewModel {
  const CommonViewModel(this._repository);
  final CommonRepository _repository;

  Future<String?> uploadImage({required String path}) async {
    try {
      var res = await _repository.uploadImage(path: path);
      return res.data;
    } catch (e, st) {
      AppLog.error(e, st);
      return null;
    }
  }

  Future<void> getVehicle(Vehicle vehicle) async {
    try {
      var res = await _repository.getVehicle(vehicle: vehicle);
      if (res.hasError) {
        return;
      }

      return;
    } catch (e, st) {
      AppLog.error(e, st);
      return;
    }
  }
}
