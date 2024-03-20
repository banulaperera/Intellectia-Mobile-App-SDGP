import 'package:client/constants.dart';
import 'package:client/screens/splash_screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 35),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/undraw_taking_notes_re_bnaf (1) 1.png"),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
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
                  ),
                  FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const InfoScreen(), transition: Transition.fadeIn);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 90),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kPrimaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                0,
                                4,
                              ), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Row(
                          children: [
                            Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
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
            ),
          ],
        ),
      ),
    );
  }
}
