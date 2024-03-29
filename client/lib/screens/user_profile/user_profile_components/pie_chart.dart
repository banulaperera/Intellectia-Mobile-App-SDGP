import 'package:client/controllers/user_profile_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/screen_dimension.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userProfileController = Get.find<UserProfileController>();
    ScreenDimensions.init(context);
    double height = ScreenDimensions.screenHeight;
    double width = ScreenDimensions.screenWidth;

    return GetBuilder<UserProfileController>(
      builder: (controller) {
        return SizedBox(
          height: height * 0.35, // 35% of screen height
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                  startDegreeOffset: -90,
                  sectionsSpace: 3,
                  centerSpaceRadius: width * 0.2, // 20% of screen width
                  sections: userProfileController.pieChartData,
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz Progress',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: width * 0.05), // 5% of screen width
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}