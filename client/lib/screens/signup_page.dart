import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/util/constants.dart';
import 'package:client/controllers/signup_page_controller.dart';
import 'package:client/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/screen_dimension.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final SignupPageController signupPageController = Get.put(SignupPageController());

  @override
  Widget build(BuildContext context) {
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: height * 0.4, // 40% of screen height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo_image.jpeg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05), // 5% of screen width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  LoginSignUpTextField(
                    key: const ValueKey('signupEmail'),
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: signupPageController.emailController,
                  ),
                  const SizedBox(height: 25),

                  Obx(() => TextField(
                    controller: signupPageController.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: signupPageController.obscureText,
                    obscuringCharacter: '*',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(right: 12),
                        icon: signupPageController.obscureText
                            ? const Icon(BootstrapIcons.eye_fill)
                            : const Icon(BootstrapIcons.eye_slash_fill),
                        onPressed: () {
                          signupPageController.isObscureText();
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
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.015, // 1.5% of screen height
                          horizontal: width * 0.05), // 5% of screen width
                    ),
                  ),),
                  const SizedBox(height: 25),
                  Obx(() => TextField(
                    controller: signupPageController.confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: signupPageController.obscureText,
                    obscuringCharacter: '*',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(right: 12),
                        icon: signupPageController.obscureText
                            ? const Icon(BootstrapIcons.eye_fill)
                            : const Icon(BootstrapIcons.eye_slash_fill),
                        onPressed: () {
                          signupPageController.isObscureText();
                        },
                      ),
                      hintText: 'Confirm Password',
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
                      contentPadding: EdgeInsets.symmetric(
                          vertical: height * 0.015, // 1.5% of screen height
                          horizontal: width * 0.05), // 5% of screen width
                    ),
                  ),),
                  const SizedBox(height: 25),
                  LoginScreenButton(
                    label: 'Sign Up',
                    onPressed: ()  {
                      signupPageController.signup(context);
                    },
                  ),
                  const SizedBox(height: 25),
                  _buildLoginNavigation(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            Get.off(() => LoginPage());
          },
          child: const Text(
            'Login',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}