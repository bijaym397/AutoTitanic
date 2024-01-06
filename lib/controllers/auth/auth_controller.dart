import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/view_models/view_models.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'mixin/api_mixin.dart';

class AuthController extends GetxController with AuthAPIMixin {
  AuthController(this._viewModel);

  final AuthViewModel _viewModel;

  // ------------------ Variable --------------------

  var emailTEC = TextEditingController();

  var nameTEC = TextEditingController();

  var phoneTEC = TextEditingController();

  var passwordTEC = TextEditingController();

  var confirmPasswordTEC = TextEditingController();

  DropDownModel? country;

  List<CountryModel> countries = [];

  final RxBool _rememberMe = false.obs;
  bool get rememberMe => _rememberMe.value;
  set rememberMe(bool value) => _rememberMe.value = value;

  @override
  void onReady() {
    super.onReady();
    getCountries();
  }

  Future<void> login() => _viewModel.login();

  List<DropDownModel> get countryList => countries
      .map((e) => DropDownModel(
            id: e.id,
            label: e.name,
          ))
      .toList();

  void onCountryChanged(DropDownModel? country) {
    _controller.country = country;
    _controller.update();
  }
}
