import 'package:auto_titanic/repositories/repositories.dart';
import 'package:auto_titanic/utils/utils.dart';

class HomeViewModel {
  const HomeViewModel(this._repository);

  final HomeRepository _repository;

  Future<void> addVehicle({required Vehicle vehicle}) => _repository.addVehicle(vehicle: vehicle);

  Future<int?> resultCount({
    String? country,
    int? minPrice,
    int? maxPrice,
    String? makeId,
    String? modelId,
  }) async {
    try {
      var data = {
        'country': country,
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'make': makeId,
        'model': modelId,
      };
      var res = await _repository.resultCount(data.removeNullValues());
      if (res.hasError) {
        return null;
      }
      AppLog.success(res);
      return null;
    } catch (e, st) {
      AppLog.error(e, st);
      return null;
    }
  }
}
