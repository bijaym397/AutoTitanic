import 'package:auto_titanic/data/data.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/utils/utils.dart';

class HomeRepository {
  const HomeRepository(this._apiWrapper);
  final ApiWrapper _apiWrapper;

  Future<ResponseModel> addVehicle({
    required Vehicle vehicle,
  }) {
    var data = {};

    return _apiWrapper.makeRequest(
      Apis.addVehicle,
      type: RequestType.post,
      payload: data,
      showLoader: true,
      headers: {},
    );
  }

  Future<ResponseModel> getBrands({
    required Vehicle vehicle,
  }) =>
      _apiWrapper.makeRequest(
        '${Apis.allMake}?type=${vehicle.value}',
        type: RequestType.get,
        headers: {},
      );

  Future<ResponseModel> getModels(
    String brandId,
  ) =>
      _apiWrapper.makeRequest(
        '${Apis.allModel}/$brandId',
        type: RequestType.get,
        headers: {},
      );

  Future<ResponseModel> resultCount(
    Map<String, dynamic> payload,
  ) =>
      _apiWrapper.makeRequest(
        Apis.resultCount,
        type: RequestType.post,
        payload: {
          'filters': payload,
        },
        showDialog: false,
        headers: {},
      );
}
