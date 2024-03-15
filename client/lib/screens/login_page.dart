import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/controllers/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:client/constants.dart';
import 'package:client/screens/signup_page.dart';
import 'package:get/get.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  final LoginPageController loginPageController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  "assets/logo_image.jpeg",
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 25),
              LoginSignUpTextField(
                key: const Key('username'),
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: loginPageController.emailController,
              ),
              const SizedBox(height: 25),

              Obx(() => TextField(
                key: const Key('password'),
                controller: loginPageController.passwordController,
                obscureText: loginPageController.obscureText,
                obscuringCharacter: '*',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    padding: const EdgeInsets.only(right: 12),
                    icon: loginPageController.obscureText
                        ? const Icon(BootstrapIcons.eye_fill)
                        : const Icon(BootstrapIcons.eye_slash_fill),
                    onPressed: () {
                      loginPageController.isObscureText();
                    },
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 2,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.black, style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: kPrimaryColor, width: 2.5),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                ),
              ),),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 50),
                child: GestureDetector(
                  onTap: () {
                    // Handle forgot password
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              LoginScreenButton(
                key: const Key('loginKey'),
                label: 'Login',
                onPressed: () {
                  loginPageController.signIn(context);
                },
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignupPage());
                    },
                    child: const Text(
                      key: Key('signupKey'),
                      'Signup',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}