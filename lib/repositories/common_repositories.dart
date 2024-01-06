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

  Future<ResponseModel> getCountries() => _apiWrapper.makeRequest(
        Apis.allCountry,
        type: RequestType.get,
        headers: {},
      );

  Future<ResponseModel> getCities(String countryId) => _apiWrapper.makeRequest(
        '${Apis.allCities}/$countryId',
        type: RequestType.get,
        headers: {},
      );
}
