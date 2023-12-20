import 'package:auto_titanic/repositories/repositories.dart';
import 'package:auto_titanic/utils/utils.dart';

class HomeViewModel {
  const HomeViewModel(this._repository);

  final HomeRepository _repository;

  Future<void> addVehicle({required Vehicle vehicle}) => _repository.addVehicle(vehicle: vehicle);
}
