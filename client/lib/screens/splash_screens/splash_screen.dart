import 'package:client/constants.dart';
import 'package:client/screens/splash_screens/info_screen.dart';
import 'package:client/util/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset("assets/undraw_taking_notes_re_bnaf (1) 1.png", fit: BoxFit.scaleDown),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRichText(),
                  _buildGetStartedButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RichText _buildRichText() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: "Intellectia\n",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              letterSpacing: 5,
              fontWeight: FontWeight.bold,
            ),
          ),
          WidgetSpan(child: SizedBox(height: 50)),
          TextSpan(
            text: "'Where education made effortless and fun'",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              letterSpacing: 4,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildGetStartedButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await LocalStorage().setOnboardStatus(false);
        Get.to(() => const InfoScreen(), transition: Transition.fadeIn);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 90),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Text(
          "Get Started",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}