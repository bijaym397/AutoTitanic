import 'package:auto_titanic/data/data.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/utils/utils.dart';

class InventoryRepository {
  InventoryRepository(this._apiWrapper);
  final ApiWrapper _apiWrapper;

  Future<ResponseModel> getVehicles({
    required Map<String, dynamic> filters,
    required Map<String, dynamic> pagination,
  }) {
    var data = {
      'filters': filters,
      'paginationDetails': pagination,
    };
    return _apiWrapper.makeRequest(
      Apis.allVehicle,
      type: RequestType.post,
      payload: data,
      headers: {},
    );
  }
}
