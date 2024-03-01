import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:client/screens/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:client/constants.dart';
import 'package:client/screens/signup_page.dart';

import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

import 'package:client/repository/user_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              const SizedBox(height: 25),
              TextField(
                controller: passwordController,
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
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                ),
              ),
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
                label: 'Login',
                onPressed: () async {
                  bool pass = await UserRepository().signIn(emailController.text, passwordController.text);
                  if(pass){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const BottomNavigation()),
                    );
                  }

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
                      );
                    },
                    child: const Text(
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
