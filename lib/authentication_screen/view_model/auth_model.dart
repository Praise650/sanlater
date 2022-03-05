import 'package:flutter/material.dart';
import 'package:sanlater/core/data/services/auth/auth_service.dart';
import 'package:stacked/stacked.dart';

class AuthModel extends BaseViewModel {
  // loading spinner
  bool _loading = false;
  // form key for user input validation
  final formKey = GlobalKey<FormState>();
  //text controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  initLogin() async {
    loading = true;
    notifyListeners();
    try {
      await AuthService().login(
          email: emailController.text, password: passwordController.text);
      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
    loading = false;
    notifyListeners();
  }

  register() async {
    loading = true;
    notifyListeners();
    try {
      await AuthService().register(
          email: emailController.text,
          firstName: firstName.text,
          lastName: lastName.text,
          phone: phoneNumber.text,
          password: confirmPassword.text);
      loading = false;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
    loading = false;
    notifyListeners();
  }
}
