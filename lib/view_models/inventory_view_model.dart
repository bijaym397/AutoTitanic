import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/repositories/repositories.dart';
import 'package:auto_titanic/utils/utils.dart';

class InventoryViewModel {
  const InventoryViewModel(this._repository);

  final InventoryRepository _repository;

  Future<List<InventoryModel>> getVehicles({
    required int page,
    required int limit,
  }) async {
    try {
      var filters = {'condition': 'used'};
      var pagination = {'page': page, 'limit': limit};
      var res = await _repository.getVehicles(filters: filters, pagination: pagination);
      if (res.hasError) {
        return [];
      }
      var body = res.bodyList;
      if (body.isEmpty) {
        return [];
      }
      return body.map((e) => InventoryModel.fromMap(e as Map<String, dynamic>)).toList();
    } catch (e, st) {
      AppLog.error(e, st);
      return [];
    }
  }
}
