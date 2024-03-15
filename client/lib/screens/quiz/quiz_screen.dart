import 'package:client/constants.dart';
import 'package:client/controllers/question_controller.dart';
import 'package:client/screens/quiz/score/score_screen.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../util/connection_lost.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());

    return FutureBuilder(
      future: controller.fetchQuestions(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
              child: connectionLost(),
            ),
          );
        } else if (controller.questions.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset(
                    'animations/Animation - 1710415777357.json',
                    height: 350,
                    reverse: true,
                    repeat: true,
                    animate: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Quiz not available',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          if (controller.questionNumber.value != controller.questions.length) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: TextButton(
                      onPressed: controller.nextQuestion,
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: const Body(<dynamic>{}),
            );
          } else {
            return ScoreScreen();
          }
        }
      },
    );
  }
}
