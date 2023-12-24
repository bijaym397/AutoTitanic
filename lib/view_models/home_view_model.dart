import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/repositories/repositories.dart';
import 'package:auto_titanic/utils/utils.dart';

class HomeViewModel {
  const HomeViewModel(this._repository);

  final HomeRepository _repository;

  Future<void> addVehicle({required Vehicle vehicle}) => _repository.addVehicle(vehicle: vehicle);

  Future<List<MakeModel>> getBrands(Vehicle vehicle) async {
    try {
      var res = await _repository.getBrands(vehicle: vehicle);
      if (res.hasError) {
        return [];
      }

      var list = res.bodyList;

      return list.map((e) => MakeModel.fromMap(e as Map<String, dynamic>)).toList();
    } catch (e, st) {
      AppLog.error(e, st);
      return [];
    }
  }

  Future<List> getModels(String brandId) async {
    try {
      var res = await _repository.getModels(brandId);
      if (res.hasError) {
        return [];
      }
      AppLog.success(res);
      return [];
    } catch (e, st) {
      AppLog.error(e, st);
      return [];
    }
  }
}
