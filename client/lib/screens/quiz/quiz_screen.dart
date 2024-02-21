import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/controllers/question_controller.dart';
 
import 'components/body.dart';
 
class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: controller.nextQuestion,
            child: const Text("Skip"),
          ),
        ],
      ),
      body: const Body(<dynamic>{}),
    );
  }
}