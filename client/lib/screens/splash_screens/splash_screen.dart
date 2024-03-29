import 'package:client/util/constants.dart';
import 'package:client/screens/splash_screens/info_screen.dart';
import 'package:client/util/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(constraints.maxWidth * 0.03), // 3% of screen width
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
                      _buildRichText(constraints),
                      _buildGetStartedButton(context, constraints),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  RichText _buildRichText(BoxConstraints constraints) {
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

  GestureDetector _buildGetStartedButton(BuildContext context, BoxConstraints constraints) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _isButtonPressed = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isButtonPressed = false;
        });
      },
      onTap: () async {
        await LocalStorage().setOnboardStatus(false);
        Get.to(() => const InfoScreen(), transition: Transition.fadeIn);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.02, horizontal: constraints.maxWidth * 0.2), // 2% of screen height and 20% of screen width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: _isButtonPressed ? kPrimaryColor.withOpacity(0.8) : kPrimaryColor,
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