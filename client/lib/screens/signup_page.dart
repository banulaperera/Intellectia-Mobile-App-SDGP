import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/screens/login_page.dart';
import 'package:flutter/material.dart';

import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import 'package:client/repository/user_repository.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo_image.jpeg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const LoginSignUpTextField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isObscured,
                    obscuringCharacter: '*',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(right: 12),
                        icon: _isObscured
                            ? const Icon(BootstrapIcons.eye_slash_fill)
                            : const Icon(BootstrapIcons.eye_fill),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isObscured,
                    obscuringCharacter: '*',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.only(right: 12),
                        icon: _isObscured
                            ? const Icon(BootstrapIcons.eye_slash_fill)
                            : const Icon(BootstrapIcons.eye_fill),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                    ),
                  ),
                  const SizedBox(height: 25),
                  LoginScreenButton(
                    label: 'Sing Up',
                    onPressed: () {
                      UserRepository().register("u2@gmail.com","u2");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupPage()),
                      );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
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
