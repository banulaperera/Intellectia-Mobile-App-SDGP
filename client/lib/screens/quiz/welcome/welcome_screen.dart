import 'package:client/screens/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:client/constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex:2),
                  Lottie.asset('animations/Animation - 1710413869166.json', height: 380, reverse: true, repeat: true, animate: true,),
                  const Spacer(), //2/6
                  Text(
                    textAlign: TextAlign.center,
                    "Are you ready for the quiz?",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color.fromARGB(255, 6, 6, 6),
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(const QuizScreen()),
                    child: Container(
                      width: 300,
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(.8),
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                      ),
                        ],
                      ),
                      child: Text(
                        "Let's Start Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: kBackgroundColor),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
