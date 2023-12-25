import 'package:auto_titanic/view_models/view_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthController(this._viewModel);

  final AuthViewModel _viewModel;

  // ------------------ Variable --------------------

  var emailTEC = TextEditingController();

  var nameTEC = TextEditingController();

  var phoneTEC = TextEditingController();

  var passwordTEC = TextEditingController();

  var confirmPasswordTEC = TextEditingController();

  final RxBool _rememberMe = false.obs;
  bool get rememberMe => _rememberMe.value;
  set rememberMe(bool value) => _rememberMe.value = value;

  Future<void> login() => _viewModel.login();
}
