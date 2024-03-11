import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/constants.dart';
import 'package:client/controllers/question_controller.dart';
import 'package:lottie/lottie.dart';

import '../../navigation_bar.dart';
// import 'package:flutter_svg/svg.dart';
 
class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.to(const BottomNavigation()),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Well Done!",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.grey.shade600, fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 25),
              Lottie.asset(
                'animations/Animation - 1710146206609.json',
                height: 250,
                repeat: true,
                animate: true,
              ),
              const SizedBox(height: 20),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "${qnController.numOfCorrectAns * 20}/${qnController.questions.length * 20}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}