import 'package:auto_titanic/repositories/repositories.dart';

class HomeViewModel {
  const HomeViewModel(this._repository);

  final HomeRepository _repository;

  Future<void> getVehicle() => _repository.getVehicle();
}
