import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/constants.dart';
import 'package:client/repository/user_repository.dart';
import 'package:client/screens/login_page.dart';
import 'package:flutter/material.dart';

import '../util/show_Alert.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  var _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
                  LoginSignUpTextField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    controller: _passwordController,
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
                            ? const Icon(BootstrapIcons.eye_fill)
                            : const Icon(BootstrapIcons.eye_slash_fill),
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
                    controller: _confirmPasswordController,
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
                            ? const Icon(BootstrapIcons.eye_fill)
                            : const Icon(BootstrapIcons.eye_slash_fill),
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
                    label: 'Sign Up',
                    onPressed: () async {
                      if(_passwordController.text.isNotEmpty && _emailController.text.isNotEmpty && _confirmPasswordController.text.isNotEmpty){
                        if (_passwordController.text ==
                            _confirmPasswordController.text) {
                          bool pass = await UserRepository().register(
                              _emailController.text, _passwordController.text);
                          if (pass) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(
                                  signUpEmail: _emailController.text,
                                ),
                              ),
                            );
                          }
                        } else {
                          showError('Passwords do not match');
                        }
                      }
                      else{
                        showError('Please fill all the fields');
                      }
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
