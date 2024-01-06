import 'package:auto_titanic/models/models.dart';
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

  Future<List<MakeModel>> getModels(String brandId) async {
    try {
      var res = await _repository.getModels(brandId);
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

  Future<List<CountryModel>> getCountries() async {
    try {
      var res = await _repository.getCountries();
      if (res.hasError) {
        return [];
      }
      var list = res.bodyList;

      return list.map((e) => CountryModel.fromMap(e as Map<String, dynamic>)).toList();
    } catch (e, st) {
      AppLog.error(e, st);
      return [];
    }
  }

  Future<List<CityModel>> getCities(String countryId) async {
    try {
      var res = await _repository.getCities(countryId);
      if (res.hasError) {
        return [];
      }
      var list = res.bodyList;

      return list.map((e) => CityModel.fromMap(e as Map<String, dynamic>)).toList();
    } catch (e, st) {
      AppLog.error(e, st);
      return [];
    }
  }
}
