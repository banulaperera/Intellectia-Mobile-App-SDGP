import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../repository/user_repository.dart';
import '../screens/navigation_bar.dart';

class LoginPageController extends GetxController {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final RxBool _obscureText = true.obs;

  bool get obscureText => _obscureText.value;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<void> signIn(BuildContext context) async {
    bool pass = await UserRepository().signIn(
      _emailController.text,
      _passwordController.text,
    );
    if (pass) {
      Get.offAll(const BottomNavigation());
    }
  }

  void isObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.onClose();
  }
}
