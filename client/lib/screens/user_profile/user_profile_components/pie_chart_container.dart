import 'package:client/controllers/user_profile_controller.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart.dart';
import 'package:client/screens/user_profile/user_profile_components/pie_chart_quiz_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/screen_dimension.dart';

class PieChartContainer extends StatelessWidget {
  const PieChartContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userProfileController = Get.find<UserProfileController>();
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

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
            padding: EdgeInsets.only(top: height * 0.02), // 2% of screen height
            child: Text(
              'Monthly Progress',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600, color: Colors.grey.shade600),
            ),
          ),
          const PieChartWidget(),
          SizedBox(
            height: height * 0.02, // 2% of screen height
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.125), // 12.5% of screen width
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
            padding: EdgeInsets.symmetric(horizontal: width * 0.125, vertical: height * 0.02), // 12.5% of screen width and 2% of screen height
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