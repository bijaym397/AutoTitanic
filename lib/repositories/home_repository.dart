import 'package:auto_titanic/data/data.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/utils/utils.dart';

class HomeRepository {
  const HomeRepository(this._apiWrapper);
  final ApiWrapper _apiWrapper;

  Future<ResponseModel> addVehicle({required Vehicle vehicle}) async {
    var data = {};

    return _apiWrapper.makeRequest(
      Apis.addVehicle,
      type: RequestType.post,
      payload: data,
      showLoader: true,
      headers: {},
    );
  }
}
