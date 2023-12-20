import 'package:auto_titanic/data/data.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/utils/utils.dart';

class AuthRepository {
  const AuthRepository(this._apiWrapper);
  final ApiWrapper _apiWrapper;

  Future<ResponseModel> login() async {
    var res = await _apiWrapper.makeRequest(
      Apis.login,
      type: RequestType.post,
      headers: {},
    );
    return res;
  }
}
