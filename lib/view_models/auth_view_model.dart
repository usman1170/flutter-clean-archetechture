import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/views/home.dart';

class AuthViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  final _authRepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    await _authRepo.loginApi(data).then((value) {
      setLoading(false);
      log(value.toString());
      Utils.showMassage(context, "Login Successfull");

      Routes().push(context, const HomeScreen());
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.showMassage(context, error.toString());
      log(error.toString());
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    await _authRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      log(value.toString());
      Utils.showMassage(context, "Sign Up Successfull");
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.showMassage(context, error.toString());
      log(error.toString());
    });
  }
}
