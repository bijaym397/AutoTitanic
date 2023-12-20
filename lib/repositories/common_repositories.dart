import 'package:auto_titanic/data/data.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/utils/utils.dart';

class CommonRepository {
  const CommonRepository(this._apiWrapper);
  final ApiWrapper _apiWrapper;

  Future<ResponseModel> uploadImage({
    required String path,
  }) =>
      _apiWrapper.makeRequest(
        Apis.fileUpload,
        type: RequestType.upload,
        field: 'images',
        filePath: path,
        headers: {},
      );

  Future<ResponseModel> getVehicle({
    required Vehicle vehicle,
  }) async {
    var res = await _apiWrapper.makeRequest(
      '${Apis.allMake}?type=${vehicle.value}',
      type: RequestType.get,
      headers: {},
    );
    return res;
  }
}
