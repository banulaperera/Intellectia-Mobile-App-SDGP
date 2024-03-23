import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../repository/user_repository.dart';
import '../screens/login_page.dart';
import '../util/show_Alert.dart';

class SignupPageController extends GetxController {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  var _obscureText = true.obs;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  bool get obscureText => _obscureText.value;

  @override
  void onInit() {
    super.onInit();
    _obscureText = true.obs;
  }

  Future<void> signup(BuildContext context) async {
    if (_passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
      if (_passwordController.text == _confirmPasswordController.text) {
        bool pass = await UserRepository()
            .register(_emailController.text, _passwordController.text);
        if (pass) {
          _emailController.clear();
          _passwordController.clear();
          _confirmPasswordController.clear();
          Get.off(LoginPage());
        }
      } else {
        showError('Passwords do not match');
      }
    } else {
      showError('Please fill all the fields');
    }
  }

  void isObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
