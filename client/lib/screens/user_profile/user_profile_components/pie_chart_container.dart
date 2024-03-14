import 'package:client/controllers/user_profile_controller.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart_quiz_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PieChartContainer extends StatelessWidget {
  const PieChartContainer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var userProfileController = Get.find<UserProfileController>();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Your Progress',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600, color: Colors.grey.shade600),
            ),
          ),
          const PieChartWidget(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: GetBuilder<UserProfileController>(
              builder: (builder) {
                return QuizTile(
                  url: 'animations/Animation - 1709316435378.json',
                  name: 'Correct Questions',
                  quizzes: userProfileController.user.correctedQuestions,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: GetBuilder<UserProfileController>(
              builder: (builder) {
                return QuizTile(
                  url: 'animations/Animation - 1709316846814.json',
                  name: 'Incorrect Questions',
                  quizzes: userProfileController.user.inCorrectedQuestions,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
