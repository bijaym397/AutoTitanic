import 'dart:convert';

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

  Future<List<MakeModel>> getVehicle(Vehicle vehicle) async {
    try {
      var res = await _repository.getVehicle(vehicle: vehicle);
      if (res.hasError) {
        return [];
      }

      var data = jsonDecode(res.data) as Map<String, dynamic>;
      var list = data['data']?['items'] as List<dynamic>?;
      if (list == null) {
        return [];
      }
      return list.map((e) => MakeModel.fromMap(e as Map<String, dynamic>)).toList();
    } catch (e, st) {
      AppLog.error(e, st);
      return [];
    }
  }
}
