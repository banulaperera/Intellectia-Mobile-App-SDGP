import 'package:client/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:client/constants.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo_image.jpeg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 25,
                      ),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              TextField(
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 2,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.none,
                                    ),
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  focusedBorder: focusedBoarder(),
                                  contentPadding: const EdgeInsets.only(
                                      left: 25, bottom: 15, top: 15),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        TextField(
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
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
                            focusedBorder: focusedBoarder(),
                            contentPadding: const EdgeInsets.only(
                                left: 25, bottom: 15, top: 15),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 15,
                            bottom: 50,
                          ),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                text: 'Forgot Password?',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  // decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle link tap here
                                    // You can navigate to another screen or open a URL here
                                  },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FittedBox(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginPage();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              // margin: const EdgeInsets.only(bottom: 70),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 140),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: kPrimaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 15,
                        bottom: 60,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle link tap here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupPage(),
                                ),
                              );
                              // You can navigate to another screen or open a URL here
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
