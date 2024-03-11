import 'package:client/constants.dart';
import 'package:client/screens/quiz/score/score_screen.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/controllers/question_controller.dart';
import 'package:lottie/lottie.dart';
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
            body: Center(
              child: Lottie.asset(
                'animations/Animation - 1710140302732.json',
                height: 250,
                repeat: true,
                animate: true,
              ),
            ),
          );
        } else {
          if(controller.questionNumber.value != controller.questions.length){
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20,),
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
          }else{
            return const ScoreScreen();
          }
        }
      },
    );
  }
}
