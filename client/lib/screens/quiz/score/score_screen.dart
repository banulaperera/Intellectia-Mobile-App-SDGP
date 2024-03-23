import 'package:client/constants.dart';
import 'package:client/controllers/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../navigation_bar.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qnController = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.to(() => const BottomNavigation(1))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset(
              'animations/Animation - 1710436633486.json',
              height: 300,
              repeat: true,
              animate: true,
            ),
            const Text(
              'Your Score: ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: qnController.numOfCorrectAns / 5,
                    color: kPrimaryColor,
                    backgroundColor: Colors.grey.shade100,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      qnController.numOfCorrectAns.toString(),
                      style: const TextStyle(fontSize: 60),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${qnController.questions.isNotEmpty ? ((qnController.numOfCorrectAns / qnController.questions.length) * 100).round() : 0}%',
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
